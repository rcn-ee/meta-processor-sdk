PR_append = "-tisdk13"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://Makefile_opencl-examples \
"

MAKEFILES_append_omap-a15 = " \
    opencl-examples \
"
