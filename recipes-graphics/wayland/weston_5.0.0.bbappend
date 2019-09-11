PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-Add-soc-performance-monitor-utilites.patch \
	file://0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch \
"
