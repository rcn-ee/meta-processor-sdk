PR_append = ".tisdk2"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

SRC_URI_append = " \
    file://0001-dts-am57xx-beagle-x15-Increase-dsp2-CMA-region.patch \
    file://0001-HACK-remoteproc-Prevent-backtrace-for-RSC_INTMEM-dep.patch \
    file://0001-Added-DT-bindings-for-DebugSS.patch \
"
