PR_append = ".tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-minicom-Update-list-of-auto-detected-EVMs.patch \
    file://0002-setup-uboot-env-keystone-Enhance-board-detection-for.patch \
    file://0003-setup-uboot-env-keystone-Add-error-checking-to-u-boo.patch \
    file://0004-setup-tftp-Copy-firmware-if-available.patch \
    file://0005-setup-uboot-env-k2g-evm-Add-u-boot-setup-for-k2g-evm.patch \
"

SDCARD_SCRIPT_k2g-evm = " create-sdcard.sh"

UBOOT_ENV_k2g-evm = "setup-uboot-env-k2g-evm.sh"
