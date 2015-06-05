PR_append = "-tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-Pick-vpe-for-decoding-interlaced-streams.patch \
    file://0002-Memory-leak-fix-gstvpebufferpool-not-freed.patch \
    file://0003-Changes-to-dynamically-allocate-vpe-buffers.patch \
    file://ti-video.conf \
"

do_install_append() {
    install -d ${D}/etc/modprobe.d
    install -m 644 ${WORKDIR}/ti-video.conf ${D}/etc/modprobe.d
}
