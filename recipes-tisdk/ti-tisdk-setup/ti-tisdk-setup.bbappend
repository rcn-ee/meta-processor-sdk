PR_append = "-tisdk2"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-setup-uboot-Reset-to-default-environment.patch \
    file://0001-create-sdcard-Fix-issue-when-root-is-not-mounted-on-.patch \
"
