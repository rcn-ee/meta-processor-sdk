PR_append = "-tisdk12"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://Makefile_omapdrm-pvr \
            file://Makefile_opencl-examples \
"

MAKEFILES_append_omap-a15 = " \
    omapdrm-pvr \
    opencl-examples \
"
