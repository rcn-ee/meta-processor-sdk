DESCRIPTION = "Task to install low-level drivers and platform libraries for the PDK"
LICENSE = "MIT"
PR = "r1"

COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

IPC = ""
IPC_append_omap-a15 = "\
    ti-ipc-rtos-src \
"
#IPC_append_keystone = "\
#   ti-ipc-rtos-src \
#"

FRAMEWORK_COMPONENTS = ""
FRAMEWORK_COMPONENTS_append_omap-a15 = "\
    ti-framework-components-src \
"

DSP_LIBS = ""
DSP_LIBS_append_omap-a15 = "\
    mathlib-c66x-src \
    dsplib-c66x-src \
    imglib-c66x-src \
"
DSP_LIBS_append_keystone = "\
    mathlib-c66x-src \
    dsplib-c66x-src \
    imglib-c66x-src \
"

CTOOLS_LIB = ""
CTOOLS_LIB_append_omap-a15 = "\
    ctoolslib-src \
"

UIA = ""
UIA_append_omap-a15 = "\
    uia-src \
"

XDAIS = ""
XDAIS_append_omap-a15 = "\
    ti-xdais-src \
"

RDEPENDS_${PN} = "\
    ti-sysbios-src \
    edma3-lld-rtos-src \
    ti-ndk-src \
    ${IPC} \
    ${FRAMEWORK_COMPONENTS} \
    ${DSP_LIBS} \
    ${CTOOLS_LIB} \
    ${UIA} \
    ${XDAIS} \
"
