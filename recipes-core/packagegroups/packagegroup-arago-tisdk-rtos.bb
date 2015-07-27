DESCRIPTION = "Task to install low-level drivers and platform libraries for the PDK"
LICENSE = "MIT"
PR = "r1"

inherit packagegroup

COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
PACKAGE_ARCH = "${MACHINE_ARCH}"

DSP_LIBS = ""
DSP_LIBS_omap-a15_append = "\
    mathlib-c66x-src \
    dsplib-c66x-src \
    imglib-c66x-src \
"

RDEPENDS_${PN} = "\
    ti-sysbios-src \
    edma3-lld-rtos-src \
    ti-ipc-rtos-src \
    ti-xdais-src \
    ti-framework-components-src \
    ti-ndk-src \
    ctoolslib-src \
    ${DSP_LIBS} \
"
