SUMMARY = "Barcode reader toolkit"
DESCRIPTION = "zbar is a barcode reader which supports multiple types of barcodes"
HOMEPAGE = "http://zbar.sourceforge.net/index.html"
LICENSE = "LGPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=42bafded1b380c6fefbeb6c5cd5448d9"

PR = "r0"

DEPENDS = "libpng jpeg"
RDEPENDS_${PN} = "libpng jpeg"

SRC_URI[sha256sum] = "234efb39dbbe5cef4189cc76f37afbe3cfcfb45ae52493bfe8e191318bdbadc6"
SRC_URI[md5sum]="0fd61eb590ac1bab62a77913c8b086a5"
SRC_URI = "http://sourceforge.net/projects/zbar/files/zbar/${PV}/zbar-${PV}.tar.bz2"
S = "${WORKDIR}/zbar-${PV}"

inherit autotools pkgconfig

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
           file://0001-scan-image-example-add-jpeg-support.patch;patchdir=${S} \
           file://Makefile \
"

export TARGET_ROOTDIR = "${STAGING_DIR_HOST}"
EXTRA_OECONF = "--host=${TARGET_SYS} --build=${BUILD_SYS}  --prefix=${prefix} --disable-video --without-imagemagick --without-gtk --without-python --without-qt --without-python --without-xshm --without-xv --with-x=no"

do_configure () {
    cd ${S}
    ./configure ${EXTRA_OECONF}
}

do_compile () {
    cd ${S}
    oe_runmake
    cp ${WORKDIR}/Makefile ${S}/examples
    cd examples
    make barcode_zbar
}

do_install () {
    cd ${S}
    oe_runmake install DESTDIR=${D}
    install -d ${D}${bindir}/
    cp ${S}/examples/barcode_zbar ${D}${bindir}/
}

PACKAGES += "libzbar"

FILES_${PN} = "${bindir}"
FILES_${PN} += "${bindir}/zbar*"
FILES_${PN} += "${datadir}"
FILES_${PN}-doc = "${datadir}/doc ${datadir}/man "
FILES_${PN}-dbg += " ${bindir}/.debug"
FILES_libzbar = "${libdir}/libzbar.so.*"
FILES_libzbar-dev = "${libdir}/libzbar.so ${libdir}/libzbar.*a ${includedir}/zbar* "
