PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-uboot-env-am335x-am43x-am57xx-evm-.sh-Config-N.patch \
"
