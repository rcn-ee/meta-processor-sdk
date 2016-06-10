PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

TARGET = "k2-fw-initrd.cpio.gz"

SRC_URI_append = " file://${TARGET};unpack=0"
