SUMMARY = "Default configuration for busybox-udhcpd"
HOMEPAGE = "http://www.busybox.net"
LICENSE = "GPLv2 & BSD-4-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"

PACKAGE_ARCH = "${MACHINE_ARCH}"

RDEPENDS:${PN}:ti33x += " usb-udhcpd-config"

PR = "r0"

S = "${WORKDIR}"

SRC_URI = " \
    file://busybox-udhcpd.default \
    file://LICENSE \
"

do_install() {
    install -d ${D}${sysconfdir}/default
    install -m 0755 ${WORKDIR}/busybox-udhcpd.default ${D}${sysconfdir}/default/udhcpd
}

FILES:${PN} += " ${sysconfdir}/default/udhcpd"
CONFFILES:${PN} += " ${sysconfdir}/default/udhcpd"
