PR:append = ".psdk0"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

RDEPENDS:${PN}-udhcpd += " busybox-udhcpd-conf"
