PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_ti43x = " \
    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
"

PACKAGE_ARCH = "${MACHINE_ARCH}"
