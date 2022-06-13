FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://gst_raw10-12_support.patch \
"

PR_append = ".tisdk0"
