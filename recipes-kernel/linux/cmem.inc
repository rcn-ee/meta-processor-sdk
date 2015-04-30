FILESEXTRAPATHS_append := ":${THISDIR}/linux"

SRC_URI += "file://cmem.dtsi"

CMEM_BASE ?= ""
CMEM_SIZE ?= ""

do_compileconfigs_prepend() {
    if [ ! -z "${CMEM_BASE}" ]
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
