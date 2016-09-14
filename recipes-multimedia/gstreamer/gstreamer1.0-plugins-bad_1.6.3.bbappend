FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PR_append = ".tisdk0"

SRC_URI_append_ti43x = " \
    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
"

SRC_URI_append_ti33x = " \
    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
"

