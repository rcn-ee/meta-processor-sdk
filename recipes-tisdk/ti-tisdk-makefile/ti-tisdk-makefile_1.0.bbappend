PR_append = "-tisdk4"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://Makefile_omapdrm-pvr \
"

MAKEFILES_append_omap-a15 = " omapdrm-pvr"

DEFCONFIG_omap-a15 = "tisdk_${MACHINE}_defconfig"
