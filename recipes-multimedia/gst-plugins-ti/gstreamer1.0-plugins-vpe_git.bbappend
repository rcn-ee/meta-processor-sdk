PR_append = "-tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-Pick-vpe-for-decoding-interlaced-streams.patch \
    file://0002-Memory-leak-fix-gstvpebufferpool-not-freed.patch \
"
