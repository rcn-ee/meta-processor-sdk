PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


SRC_URI += "\
    file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch \
"


