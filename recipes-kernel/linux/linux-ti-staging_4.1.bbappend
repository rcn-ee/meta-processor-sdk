PR_append = ".tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

SRC_URI_append = " \
    file://0001-dts-am57xx-beagle-x15-Increase-dsp2-CMA-region.patch \
    file://0001-HACK-remoteproc-Prevent-backtrace-for-RSC_INTMEM-dep.patch \
    file://0001-Added-DT-bindings-for-DebugSS.patch \
    file://0001-ASoC-simple-card-Add-system-clock-direction-DT-param.patch \
    file://0001-media-ti-vpe-vpe-Add-cropping-ioctl-support.patch \
    file://0001-HACK-Remove-the-V4L2-check-and-fix-the-DMA-address.patch \
"
