PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0002-gstv4l2src-Optimize-delay-in-capture.patch \
"
