PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://setup-uboot-env-am57xx-evm-Enhance-to-parse-uEnv.patch"
