FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PR:append = ".psdk0"

SRC_URI:append = " \
    file://timesyncd.conf \
"

do_install():append {
    install -d ${D}${sysconfdir}/systemd/
    install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/timesyncd.conf
}
