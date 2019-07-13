PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-Add-soc-performance-monitor-utilites.patch \
"
