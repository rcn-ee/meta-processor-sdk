PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://Makefile_cmem-mod"

MAKEFILES_append_omap-a15 = " cmem-mod"
