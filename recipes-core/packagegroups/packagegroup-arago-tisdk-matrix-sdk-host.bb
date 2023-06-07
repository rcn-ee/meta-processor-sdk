DESCRIPTION = "Task to install Matrix v2 and associated applications sources in the SDK"
LICENSE = "MIT"
PR = "r0"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

RDEPENDS:${PN} = "\
    matrix-gui-src \
"
