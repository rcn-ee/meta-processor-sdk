DESCRIPTION="TI dsptop utility."

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979"

include dsptop.inc

PR = "${INC_PR}.0"

DEPENDS = "libulm ncurses"

RDEPENDS_${PN} = "debugss-module-drv"

COMPATIBLE_MACHINE = "dra7xx"
PACKAGE_ARCH = "${MACHINE_ARCH}"

DEVICE = ""
DEVICE_dra7xx = "DRA7xx"

EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
PARALLEL_MAKE = ""

S = "${WORKDIR}/git/dsptop"

do_install() {
    oe_runmake install DESTDIR=${D}
}
