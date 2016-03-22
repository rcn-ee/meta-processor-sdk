PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://YUYV-to-BGR24-optimization.patch \
"

EXTRA_OECONF_append += "CFLAGS='-O3'"
