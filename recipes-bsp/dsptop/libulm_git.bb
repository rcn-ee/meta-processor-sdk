DESCRIPTION="TI dsptop utility."

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://../debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979"

include dsptop.inc

DEPENDS = "ti-cgt6x-native"

PR = "${INC_PR}.0"

ALLOW_EMPTY_${PN} = "1"

COMPATIBLE_MACHINE = "dra7xx"
PACKAGE_ARCH = "${MACHINE_ARCH}"

PARALLEL_MAKE= ""

S = "${WORKDIR}/git/dsptop/ulm"

DEVICE=""
DEVICE_dra7xx = "DRA7xx"

EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"

do_compile() {
    oe_runmake arm XPORT_ONLY
    oe_runmake dsp C6X_C_DIR=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x/include
}

do_install() {
    install -d ${D}${includedir}
    install -d ${D}${libdir}
    install -d ${D}${datadir}/ti/ulm
    cp -f tiulm.h ${D}${includedir}
    cp -f release/libtiulm.a ${D}${libdir}
    cp -f tiulm.h ${D}${datadir}/ti/ulm
    cp -f release/libtiulm.ae66 ${D}${datadir}/ti/ulm
}

FILES_${PN}-dev += "\
    ${datadir}/ti/ulm \
"
