PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-HACK-gen_dispatch-use-KHR-khrplatform.h-instead-of-l.patch \
"
