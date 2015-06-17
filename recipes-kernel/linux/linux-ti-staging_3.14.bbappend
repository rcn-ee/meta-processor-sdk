PR_append = "-tisdk12"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"

SRC_URI += "file://0001-DRA7-IVA-Set-iva-initial-freq.patch \
            file://0002-DRA7-IVA-Add-IVA-OPP_HIGH-config.patch \
            file://0003-arm-defconfig-omap2plus-enable-display.patch \
            file://0004-arm-dts-dra7xx-Add-gpu-dts-entry.patch \
            file://0005-arm-dra7xx-Add-gpu-hwmod-data.patch \
            file://0006-drm-omap-Add-omapdrm-plugin-API-recreated-patch-from.patch \
            file://0007-arm-dts-am57x-Add-gpu-supply-revisit-this-after-this.patch \
            file://0008-drivers-power-Introduce-TI-coprocessor-driver.patch \
            file://0009-ARM-DRA7-dts-Add-coprocessor-nodes-for-iva-recreated.patch \
            file://0010-Enable-TI-coprocessor-driver-for-dra7-family.patch \
            file://0001-media-ti-vpe-vpe-Add-cropping-ioctl-support.patch \
            file://0002-v4l2-core-videobuf2-core.c-fix.patch \
            file://0001-Added-DT-bindings-for-DebugSS.patch \
            file://0001-opp33xx_data-Enabled-1-GHz-for-2.0-Silicon.patch \
            file://0001-Revert-input-ti_am335x_tsc-Ignore-previous-pen-down-event.patch \
            file://0002-Input-ti_am335x_tsc-remove-udelay-in-interrupt-handler.patch \
            file://0003-Input-ti_am335x_tsc-replace-delta-filtering-with-median-filtering.patch \
"

CMEM_BASE_omap-a15 = "a0000000"
CMEM_SIZE_omap-a15 = "20000000"
