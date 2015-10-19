PR_append = ".tisdk3"

SRCREV = "c9770c21bfb5c3a3fcc5eaf969988f79bd4dc2b8"

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
    file://0001-dts-dra7-evm-Increase-dsp2-CMA-region.patch \
"

SRC_URI_append_keystone = " \
    file://0001-uio-add-support-for-ioctls.patch \
    file://0002-remoteproc-Add-hooks-to-download-and-run-firmware-fr.patch \
    file://0003-Documentation-ti-keystone-rproc-Add-documentation-fo.patch \
    file://0004-remoteproc-Add-support-for-remoteproc-for-Keystone2-.patch \
    file://0005-Documentation-uio-ti-pdrv-Add-documentation-for-ti-u.patch \
    file://0006-uio-ti-pdrv-Add-uio-based-driver-for-TI-peripheral-m.patch \
    file://0007-dts-k2hk-Add-entries-for-DSP-remote-proc-nodes-for-k.patch \
    file://0008-configs-Update-keystone_defconfig-with-new-modules.patch \
    file://0009-virtio_rpmsg-Add-dma-sync-ipc-messages-when-dma-cohe.patch \
    file://0010-ipc.cfg-Add-keystone-remoteproc.patch \
"
