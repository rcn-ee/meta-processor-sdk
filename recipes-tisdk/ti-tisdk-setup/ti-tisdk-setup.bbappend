PR_append = ".tisdk6"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-setup-tftp-Copy-initramfs-if-available.patch \
"

SRCREV = "1977ccac159523308ad009d0e1c702b682e33c50"

SDCARD_SCRIPT_k2g-evm = " create-sdcard.sh"

UBOOT_ENV_k2g-evm = "setup-uboot-env-k2g-evm.sh"
