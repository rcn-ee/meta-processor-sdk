FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-DRM-test-code-enhancements-drm_clone.c-drm_extended..patch \
"

PR_append = ".tisdk2"
