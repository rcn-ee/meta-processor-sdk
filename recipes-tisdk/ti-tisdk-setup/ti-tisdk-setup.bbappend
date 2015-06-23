PR_append = "-tisdk2"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://setup-uboot-env-am57xx-evm-Enhance-to-parse-uEnv.patch \
    file://setup-uboot-env-am57xx-evm-Detect-USB-connection.patch \
    file://create-sdcard-Fix-misspelling.patch \
"
