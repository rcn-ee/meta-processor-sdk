DESCRIPTION = "Configuration files for usb interface with udhcpd"
SECTION = "console/network"
HOMEPAGE = "http://udhcp.busybox.net/"
LICENSE = "GPLv2 & BSD-4-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"

PR = "r0"

S = "${WORKDIR}"

# Default configuration file is from the base udhcp package
SRC_URI = "file://udhcpd_usb0.conf \
           file://LICENSE"

do_install() {
    install -d ${D}${sysconfdir}
    install -m 0755 ${S}/udhcpd_usb0.conf ${D}${sysconfdir}
}

FILES_${PN} += "${sysconfdir}/udhcpd_usb0.conf"
CONFFILES_${PN} += "${sysconfdir}/udhcpd_usb0.conf"
