PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

SRC_URI_append = " \
    file://0001-dts-am57xx-beagle-x15-Increase-dsp2-CMA-region.patch \
"
