PR_append = ".tisdk2"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-uboot-env-am335x-am43x-am57xx-evm-.sh-Config-N.patch \
    file://0001-setup-uboot-env-am43x-Set-devtype-to-mmc-for-all-boo.patch \
    file://0001-setup-package-install-Add-dos2unix-to-list-of-packag.patch \
"
