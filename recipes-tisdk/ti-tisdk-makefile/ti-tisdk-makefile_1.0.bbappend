PR_append = "-tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://Makefile_cmem-mod"

MAKEFILES_append_omap-a15 = " cmem-mod"

DEFCONFIG_omap-a15 = "tisdk_${MACHINE}_defconfig"
