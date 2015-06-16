LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"

SRCREV = "adae69a898c21bf6a905d4fb32a977713149bbd8"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-DRM-test-code-enhancements-drm_clone.c-drm_extended..patch \
"

PR_append = "-tisdk1"
