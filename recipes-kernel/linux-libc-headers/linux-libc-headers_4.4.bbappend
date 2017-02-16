PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"

SRC_URI_append = " file://0001-uapi-add-missing-install-of-dma-buf.h.patch"
