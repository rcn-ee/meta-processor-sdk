PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Pick-vpe-for-decoding-interlaced-streams.patch"
