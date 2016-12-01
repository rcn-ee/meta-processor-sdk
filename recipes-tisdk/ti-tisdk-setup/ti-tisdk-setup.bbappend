PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-uboot-env-am335x-am437x-am57xx-update-for-late.patch \
    file://0002-setup-uboot-env-k2g-evm.sh-update-for-latest-default.patch \
"
