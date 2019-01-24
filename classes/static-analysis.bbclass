# static-analysis.bbclass is intended a generic class to perform static code
#   analysis without favoring any specific set of tools. This class provides
#   certain stages at which custom commands may be injected. This leaves the
#   tool-specific implementation to the configuration.


# Variable which may be used to enable/disable static analysis. This will mainly
#   be used if globally inheriting the static-analysis class.
#   (e.g. 'INHERIT += "static-analysis"' in some conf file.
#
# STATIC_ANALYSIS_ENABLE is the main variable which controls whether to perform
#   the static analysis. Once the static analysis class is inherited, this may
#   be used to globally enable/disable static-analysis, or normal bitbake
#   overrides may be used to enable/disable more slectively.
#
# STATIC_ANALYSIS_ENABLE_RECIPES can be used to provide a list of recipes for
#   which to enable static analysis. Recipes listed in this variable will be
#   enabled, overriding possible conflict set in STATIC_ANALYSIS_ENABLE.
#
# STATIC_ANALYSIS_DISABLE_RECIPES can be used to provide a list of recipes for
#   which to disable static analysis. Recipes listed in this variable will be
#   disabled, overriding possible conflict set in STATIC_ANALYSIS_ENABLE_RECIPES
#   and STATIC_ANALYSIS_ENABLE.
#
STATIC_ANALYSIS_ENABLE ?= "1"
STATIC_ANALYSIS_ENABLE_RECIPES ?= ""
STATIC_ANALYSIS_DISABLE_RECIPES ?= ""


# STATIC_ANALYSIS_COMPILE_SCRIPT is a file to which the original do_compile task
#   will be written. This allows the static-analysis wrapper to work on a
#   seperate process.
STATIC_ANALYSIS_COMPILE_SCRIPT ?= "${WORKDIR}/static_analysis_compile.sh"


# The statis-analysis class will inject commands in 3 stages of the build. The
#   following variables specify these commands and influence how they are
#   executed.
#
# The 3 stages are the following:
#
#  - PREBUILD  : This command will be executed before running any tasks.
#  - COMPILE   : If static analysis is enabled for a recipe, this comand will
#                  override the do_compile task. The normal do_compile task will
#                  be written to the script specified by the
#                  STATIC_ANALYSIS_COMPILE_SCRIPT variable, and thus can be
#                  provided to the static analysis compile wrapper command.
#  - POSTBUILD : This command will be executed after all tasks have completed.
#
#
# The following variables influence the behavior for each injection point.
#
#  - COMMAND     : The command to execute.
#  - EXPORT_VARS : Variables which must be exported to the environment of the
#                    COMMAND.
#  - DIRS        : Directories which must be created prior to executing the
#                    COMMAND.
#

# By default, do nothing.
STATIC_ANALYSIS_PREBUILD_COMMAND ?= ":"
STATIC_ANALYSIS_PREBUILD_EXPORT_VARS ?= ""
STATIC_ANALYSIS_PREBUILD_DIRS ?= ""

# By default, run the compile script, to get to the original behavior.
STATIC_ANALYSIS_COMPILE_COMMAND ?= "sh ${STATIC_ANALYSIS_COMPILE_SCRIPT}"
STATIC_ANALYSIS_COMPILE_EXPORT_VARS ?= ""
STATIC_ANALYSIS_COMPILE_DIRS ?= ""

# By default, do nothing.
STATIC_ANALYSIS_POSTBUILD_COMMAND ?= ":"
STATIC_ANALYSIS_POSTBUILD_EXPORT_VARS ?= ""
STATIC_ANALYSIS_POSTBUILD_DIRS ?= ""


# Simple routine to make it easier to enable for a list of recipes
python() {
    for p in (d.getVar('STATIC_ANALYSIS_ENABLE_RECIPES', True) or "").split():
        d.setVar('STATIC_ANALYSIS_ENABLE_pn-%s' % p, '1')
    for p in (d.getVar('STATIC_ANALYSIS_DISABLE_RECIPES', True) or "").split():
        d.setVar('STATIC_ANALYSIS_ENABLE_pn-%s' % p, '0')
}

# Run the PREBUILD_COMMAND
static_analysis_prebuild() {
    ${STATIC_ANALYSIS_PREBUILD_COMMAND}
}
static_analysis_prebuild[dirs] += "${STATIC_ANALYSIS_PREBUILD_DIRS}"

# Run the POSTBUILD_COMMAND
static_analysis_postbuild() {
    ${STATIC_ANALYSIS_POSTBUILD_COMMAND}
}
static_analysis_postbuild[dirs] += "${STATIC_ANALYSIS_POSTBUILD_DIRS}"

# Add static analysis wrapper around the do_compile task
#
#   This works by writing the original do_compile task to a script and then
#  calling this script with the static analysis command.
#
def static_analysis_compile_wrapper(d):
    if ((d.getVar('STATIC_ANALYSIS_ENABLE', True)) == '1'):
        cwd = None

        # Make a copy of do_compile
        do_compile = d.getVar('do_compile', True)
        do_compile_flags = d.getVarFlags('do_compile')

        # If do_compile is empty, there is nothing to do.
        if not do_compile:
            return

        # Back-up original do_compile task
        d.setVar('do_compile_static_analysis', do_compile)
        d.setVarFlags('do_compile_static_analysis', do_compile_flags)

        work_dir = d.getVar('WORKDIR', True)

        # Write the original do_compile to a shell script
        #
        #   See exec_func_shell() method in bitbake/lib/bb/build.py
        #
        compile_script = d.getVar('STATIC_ANALYSIS_COMPILE_SCRIPT', True)
        with open(compile_script, "w") as script:
            localdata = bb.data.createCopy(d)
            localdata.delVarFlag('PWD', 'export')

            # Export the variables specified
            for var in (d.getVar('STATIC_ANALYSIS_COMPILE_EXPORT_VARS', True) or '').split():
                localdata.setVarFlag(var, 'export', '1')

            script.write(bb.build.shell_trap_code())
            bb.data.emit_func('do_compile_static_analysis', script, localdata)

            if bb.msg.loggerVerboseLogs:
                    script.write("set -x\n")
            if cwd:
                script.write("cd '%s'\n" % cwd)
            script.write("%s\n" % 'do_compile_static_analysis')
            script.write('\n# cleanup\n')
            script.write('ret=$?\n')
            script.write("trap '' 0\n")
            script.write('exit $ret\n')


        # New do_compile task will call a wrapper on the script containing the
        #   original task.
        do_compile_wrapper = '    ' + d.getVar('STATIC_ANALYSIS_COMPILE_COMMAND', True)
        d.setVar('do_compile', do_compile_wrapper)

        # Create the necessary directories
        for dir in (d.getVar('STATIC_ANALYSIS_COMPILE_DIRS', True) or '').split():
            bb.utils.mkdirhier(dir)

do_compile[vardeps] += "STATIC_ANALYSIS_ENABLE STATIC_ANALYSIS_COMPILE_COMMAND"

# Add task event handler to perform the static analysis wrapper at the latest
#   possible moment, when the do_compile task starts. 
#
static_analysis_taskeventhandler() {
    if e.getTask() == "do_compile":
        static_analysis_compile_wrapper(e.data)
}
addhandler static_analysis_taskeventhandler
static_analysis_taskeventhandler[eventmask] = "bb.build.TaskStarted"


# Add build event handler to sync checkers when the build starts, and perform
#   analysis when the build completes.
#
# A note about the build event handlers. If there is an error in one of these
#   event handlers, then there will be a trace dump. This is undesired as the
#   actual error message is then burried beneath the trace. There should be a
#   way to gracefully fail... Maybe fire a build failed event?
#
static_analysis_buildeventhandler() {
    localdata = bb.data.createCopy(e.data)
    if isinstance(e, bb.event.BuildStarted):
        bb.note("Executing Static Analysis Pre-Build Command...")

        for var in (localdata.getVar('STATIC_ANALYSIS_PREBUILD_EXPORT_VARS', True) or '').split():
            localdata.setVarFlag(var, 'export', '1')

        bb.build.exec_func("static_analysis_prebuild", localdata)
    elif isinstance(e, bb.event.BuildCompleted):
        bb.note("Executing Static Analysis Post-Build Command...")

        for var in (localdata.getVar('STATIC_ANALYSIS_POSTBUILD_EXPORT_VARS', True) or '').split():
            localdata.setVarFlag(var, 'export', '1')

        bb.build.exec_func("static_analysis_postbuild", localdata)
}
addhandler static_analysis_buildeventhandler
static_analysis_buildeventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
