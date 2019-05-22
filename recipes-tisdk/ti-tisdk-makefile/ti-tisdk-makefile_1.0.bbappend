PR_append = ".tisdk65"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
    file://Makefile_ti-ipc \
    file://Makefile_video-graphics-test \
    file://Makefile_jailhouse \
    file://Makefile_evse-hmi \
    file://Makefile_protection-relays-hmi \
    file://Makefile_tiovx-app-host \
    file://Makefile_tidl-examples \
    file://Makefile_pru-adc \
"

SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"

MAKEFILES_MATRIX_GUI_omapl138 = ""

MAKEFILES_append_keystone = " ti-ipc"
MAKEFILES_append_k3 = " ti-ipc"

MAKEFILES_append_k2g = " opencl-examples \
                         openmpacc-examples \
"

MAKEFILES_append_omap-a15 = " dual-camera-demo \
                              image-gallery \
                              ti-ipc \
                              big-data-ipc-demo \
			      evse-hmi \
"

MAKEFILES_append_omapl138 = " ti-ipc \
                              linux-dtbs \
                              u-boot-spl \
"
MAKEFILES_remove_omapl138 = "pru"
MAKEFILES_remove_omapl138 = "u-boot-legacy"

MAKEFILES_append_omap-a15 = " video-graphics-test"

MAKEFILES_append_ti43x = " evse-hmi"

MAKEFILES_append_ti33x = " evse-hmi \
			   protection-relays-hmi \
"

MAKEFILES_append_k3 = " evse-hmi"

MAKEFILES_append_am335x-evm = " pru-adc"

MAKEFILES_append_am57xx-evm = " jailhouse \
                                tidl-examples \
"
MAKEFILES_append_am57xx-hs-evm = " tidl-examples"

MAKEFILES_append_k2g = " pru-icss"

MAKEFILES_append_dra7xx = " tiovx-app-host"

MAKEFILES_remove_ti33x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
MAKEFILES_remove_ti43x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"

MAKEFILES_remove_keystone = "hplib-mod ipsecmgr-mod"

PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"

IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\(C6X_GEN_INSTALL_PATH\)""
IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\(TOOLCHAIN_PATH_M4\)" ti.targets.arm.elf.M4F="\$\(TOOLCHAIN_PATH_M4\)""
IPC_TOOLS_PATHS_R5F  = "ti.targets.arm.elf.R5F="\$\(TOOLCHAIN_PATH_R5\)""
IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\(C6X_GEN_INSTALL_PATH\)""

IPC_TOOLS_PATHS = ""
IPC_TOOLS_PATHS_append_keystone = " ${IPC_TOOLS_PATHS_C66}"
IPC_TOOLS_PATHS_append_omap-a15 = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}"
IPC_TOOLS_PATHS_append_omapl138 = " ${IPC_TOOLS_PATHS_C674}"
IPC_TOOLS_PATHS_append_k3 = "${IPC_TOOLS_PATHS_R5F}"

do_install_append() {
    sed -i -e "s/__IPC_TOOLS_PATHS__/${IPC_TOOLS_PATHS}/g" ${D}/Makefile
    sed -i -e "s/__TISDK_VERSION__/${TISDK_VERSION}/g" ${D}/Makefile

    cat >> ${D}/Rules.make << __EOF__

# Set EXEC_DIR to install example binaries
EXEC_DIR=__EXEC_DIR__
__EOF__
}


# Populate UBOOT_MACHINE when UBOOT_CONFIG is used
# (see uboot-config.bbclass)
python() {
    ubootmachine = d.getVar("UBOOT_MACHINE", True)
    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
    # The "doc" varflag is special, we don't want to see it here
    ubootconfigflags.pop('doc', None)

    if ubootmachine and ubootconfigflags:
        bb.warn('UBOOT_MACHINE = "%s", UBOOT_CONFIG(flags) = "%s"' % (ubootmachine, ubootconfigflags))
        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")

    if not ubootconfigflags:
        return

    ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
    if len(ubootconfig) > 0:
        for config in ubootconfig:
            for f, v in ubootconfigflags.items():
                if config == f:
                    items = v.split(',')
                    if items[0] and len(items) > 3:
                        raise bb.parse.SkipPackage('Only config,images,binary can be specified!')
                    # From u-boot-ti.inc, the last config is the default
                    # So keep overwriting UBOOT_MACHINE to get to the default
                    d.setVar('UBOOT_MACHINE', items[0])
                    break
    elif len(ubootconfig) == 0:
       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
}
