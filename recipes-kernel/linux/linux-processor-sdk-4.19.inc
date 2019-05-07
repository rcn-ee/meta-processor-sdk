PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://jailhouse.cfg \
                   file://docker.cfg"

SRC_URI_append_ti33x = " file://am335x-pru-adc.dtsi"

KERNEL_CONFIG_FRAGMENTS_append = " ${WORKDIR}/docker.cfg"
KERNEL_CONFIG_FRAGMENTS_append_am57xx-evm = " ${WORKDIR}/jailhouse.cfg"

do_setup_adc() {
:
}

do_setup_adc_ti33x() {
    dts="am335x-boneblack-pru-adc.dts"
    dtsi="am335x-pru-adc.dtsi"
    cp ${S}/arch/arm/boot/dts/am335x-boneblack.dts ${S}/arch/arm/boot/dts/$dts
    cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
    echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
}

do_patch[postfuncs] += "do_setup_adc"

RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " pruhsr-fw pruprp-fw"
RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " pruhsr-fw pruprp-fw"
RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " pruhsr-fw pruprp-fw"
RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " pruhsr-fw pruprp-fw"

RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " netcp-sa-fw"
