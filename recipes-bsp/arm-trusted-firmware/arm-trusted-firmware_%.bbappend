PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://0001-HACK-firmware-ti_sci-remove-EXCLUSIVE-flag.patch"
