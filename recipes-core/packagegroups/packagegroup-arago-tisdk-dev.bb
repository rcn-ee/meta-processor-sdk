DESCRIPTION = "Task to install development packages for SDKs"
LICENSE = "MIT"
PR = "r1"

inherit packagegroup

PACKAGE_ARCH = "${MACHINE_ARCH}"

DEV_PACKAGES = ""
DEV_PACKAGES_dra7xx_append = " \
    opencl-staticdev \
"

RDEPENDS_${PN} = "\
    ${DEV_PACKAGES} \
"
