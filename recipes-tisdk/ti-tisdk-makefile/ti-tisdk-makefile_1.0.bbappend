PR_append = "-tisdk2"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://Makefile_cmem-mod \
            file://Makefile_omapdrm-pvr \
"

MAKEFILES_append_omap-a15 = " cmem-mod omapdrm-pvr"

DEFCONFIG_omap-a15 = "tisdk_${MACHINE}_defconfig"
