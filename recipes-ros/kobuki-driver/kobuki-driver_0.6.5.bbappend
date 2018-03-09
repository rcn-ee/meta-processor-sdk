PR_append = ".int0"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append += "\
    file://kobuki.conf \
"

do_install_append() {
    install -d ${D}${sysconfdir}/modules-load.d/
    install -d ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${S}/../kobuki_ftdi/57-kobuki.rules ${D}${sysconfdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/kobuki.conf ${D}${sysconfdir}/modules-load.d/
}

