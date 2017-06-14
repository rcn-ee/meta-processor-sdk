PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-find-the-desired-pixel-format-from-the-format-list-o.patch \
"

