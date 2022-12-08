FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://gst_raw10-12_support.patch \
    file://0001-Adding-support-for-bayer-formats-with-IR-component.patch \
    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
"

PR_append = ".tisdk1"
