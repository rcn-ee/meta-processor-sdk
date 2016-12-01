PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
"
