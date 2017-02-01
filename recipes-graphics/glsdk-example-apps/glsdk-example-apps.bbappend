PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-soc_performance_monitor.cfg-add-DSP2.patch \
	file://0001-drm-tests-handle-usecase-where-display-is-disabled.patch \
"
