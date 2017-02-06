PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-display-kms-and-display-kmscube-handle-usecase-where.patch \
"

