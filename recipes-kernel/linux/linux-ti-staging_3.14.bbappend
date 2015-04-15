PR_append = "-tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"

SRC_URI += "file://cmem.dtsi \
            file://0001-DRA7-IVA-Set-iva-initial-freq.patch \
            file://0002-DRA7-IVA-Add-IVA-OPP_HIGH-config.patch \
            file://0003-arm-defconfig-omap2plus-enable-display.patch \
            file://0004-arm-dts-dra7xx-Add-gpu-dts-entry.patch \
            file://0005-arm-dra7xx-Add-gpu-hwmod-data.patch \
            file://0006-drm-omap-Add-omapdrm-plugin-API-recreated-patch-from.patch \
            file://0007-arm-dts-am57x-Add-gpu-supply-revisit-this-after-this.patch \
            file://0008-drivers-power-Introduce-TI-coprocessor-driver.patch \
            file://0009-ARM-DRA7-dts-Add-coprocessor-nodes-for-iva-recreated.patch \
            file://0010-Enable-TI-coprocessor-driver-for-dra7-family.patch \
"

CMEM_BASE = ""
CMEM_SIZE = ""

CMEM_BASE_omap-a15 = "a0000000"
CMEM_SIZE_omap-a15 = "20000000"

do_compileconfigs_prepend() {
    if [ ! -z CMEM_BASE ]
    then
        cp ${WORKDIR}/cmem.dtsi ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi

        sed -i -e "s|__CMEM_BASE__|${CMEM_BASE}|g" \
               -e "s|__CMEM_SIZE__|${CMEM_SIZE}|g" \
               ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi

        for dts in ${KERNEL_DEVICETREE}
        do
            echo "#include \"${MACHINE}-cmem.dtsi\"" >> ${S}/arch/arm/boot/dts/${dts%.dtb}.dts
        done
    fi
}
