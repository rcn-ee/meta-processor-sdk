PR = "r0"

DESCRIPTION = "Processor-SDK Seva packagegroup"

PACKAGE_ARCH = "${MACHINE_ARCH}"
inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = "packagegroup-seva"

RDEPENDS:${PN} = " \
    seva-browser \
    seva-launcher \
"
