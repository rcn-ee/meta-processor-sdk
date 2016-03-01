PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://0001-kmscube.c-init_drm-enable-AM3-support.patch"

COMPATIBLE_MACHINE_append = "|ti33x"
