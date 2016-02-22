PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://0001-setup-targetfs-nfs-Request-user-input-if-multiple-fi.patch"
