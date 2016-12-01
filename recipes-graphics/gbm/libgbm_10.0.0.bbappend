PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-Hack-gbm.pc.in-add-ldl-at-Libs-to-pass-the-QT5-confi.patch \
"
