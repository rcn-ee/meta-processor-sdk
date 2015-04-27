PR_append = "-tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DEPENDS_append_dra7xx = " libdce libdrm"

PACKAGECONFIG = "faad ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"

SRC_URI_append = " file://0006-GstDRMBufferPool-support-fix.patch"
