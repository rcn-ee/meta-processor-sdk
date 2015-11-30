PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-tftp-Copy-pmmc-firmware-if-available.patch \
    file://0002-setup-uboot-env-k2g-evm-Add-u-boot-seupt-for-k2g-evm.patch \
"

SDCARD_SCRIPT_k2g-evm = " create-sdcard.sh"

UBOOT_ENV_k2g-evm = "setup-uboot-env-k2g-evm.sh"
