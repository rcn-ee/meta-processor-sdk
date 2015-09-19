DESCRIPTION = "Task to install Processor SDK top-level files and demos"
LICENSE = "MIT"
PR = "r0"

inherit packagegroup

COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
PACKAGE_ARCH = "${MACHINE_ARCH}"

DEMOS = ""
DEMOS_append_omap-a15 = " image-proc-rtos"

RDEPENDS_${PN} = "\
    ti-proc-sdk-eclipse \
    ti-proc-sdk-extras \
    ${DEMOS} \
"
