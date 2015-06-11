PR_append = "-tisdk4"

SRCREV = "876d28b2de5fa02d0f5fa836cba7be9a14b819eb"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://ti-video.conf \
"

do_install_append() {
    install -d ${D}/etc/modprobe.d
    install -m 644 ${WORKDIR}/ti-video.conf ${D}/etc/modprobe.d
}
