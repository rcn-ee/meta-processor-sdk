PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch \
"
