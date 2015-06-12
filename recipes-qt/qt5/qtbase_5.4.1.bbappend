PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-deform-Fix-how-controls-are-shown.patch \
    file://0002-deform-disable-opengl-button.patch \
"
