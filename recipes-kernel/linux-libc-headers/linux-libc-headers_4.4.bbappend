PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"

SRC_URI_append = " file://0001-uapi-add-missing-install-of-dma-buf.h.patch"

SRCREV = "7c580a51af521f320eb56717f291aa5b64c2f244"
