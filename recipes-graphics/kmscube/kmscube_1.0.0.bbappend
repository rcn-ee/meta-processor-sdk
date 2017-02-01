PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0003-kmscube.c-init_drm-handle-usecase-where-display-is-d.patch \
"

