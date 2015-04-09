PR_append = "-tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-create-sdcard-Fix-issue-when-root-is-not-mounted-on-.patch \
"
