PR_append = "-tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-setup-uboot-Reset-to-default-environment.patch \
    file://0001-create-sdcard-Fix-issue-when-root-is-not-mounted-on-.patch \
    file://0002-setup-uboot-env-am43x-Set-devtype-to-mmc-to-boot-fro.patch \
"
