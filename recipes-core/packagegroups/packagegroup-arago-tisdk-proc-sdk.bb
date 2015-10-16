DESCRIPTION = "Task to install Processor SDK top-level files and demos"
LICENSE = "MIT"
PR = "r0"

COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

DEMOS = ""
DEMOS_append_omap-a15 = " image-proc-rtos"

# Removed ti-proc-sdk-eclipse from RDEPENDS until 2.0.1 when eclipse plugin
# support will be completed
RDEPENDS_${PN} = "\
    ti-proc-sdk-extras \
    ${DEMOS} \
"
