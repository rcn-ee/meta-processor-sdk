PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

SRC_URI_append = " \
    file://0001-dts-am57xx-beagle-x15-Increase-dsp2-CMA-region.patch \
    file://0002-HACK-remoteproc-Prevent-backtrace-for-RSC_INTMEM-dep.patch \
    file://0003-Added-DT-bindings-for-DebugSS.patch \
    file://0004-ASoC-simple-card-Add-system-clock-direction-DT-param.patch \
    file://0005-media-ti-vpe-vpe-Add-cropping-ioctl-support.patch \
    file://0006-HACK-Remove-the-V4L2-check-and-fix-the-DMA-address.patch \
    file://0007-opp33xx_data-Enabled-1-GHz-for-2.0-Silicon.patch \
    file://0008-drivers-media-v4l2-core-videobuf2-core-supress-the-w.patch \
    file://0009-ARM-DTS-am437x-sk-evm-Switch-using-simple-audio-card.patch \
    file://0001-dts-dra7-evm-Increase-dsp2-CMA-region.patch \
"
