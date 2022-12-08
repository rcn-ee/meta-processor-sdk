FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://gst_raw10-12_support.patch \
    file://0001-Adding-support-for-bayer-formats-with-IR-component.patch \
"

PR_append = ".tisdk0"
