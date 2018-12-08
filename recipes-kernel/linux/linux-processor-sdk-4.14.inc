PR_append = ".tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:${THISDIR}/files:"

#require linux-ti-staging-4.14-patches.inc

SRC_URI_append = " file://jailhouse.cfg \
                   file://docker.cfg"

SRC_URI_append_ti33x = " file://am335x-pru-adc.dtsi"

KERNEL_CONFIG_FRAGMENTS_append = " ${WORKDIR}/docker.cfg"
KERNEL_CONFIG_FRAGMENTS_append_am57xx-evm = " ${WORKDIR}/jailhouse.cfg"

AM57XX_KERNEL_DEVICETREE = " \
    am57xx-evm-jailhouse.dtb \
    am57xx-evm-reva3-jailhouse.dtb \
    am572x-idk-jailhouse.dtb \
    am572x-idk-lcd-osd101t2045-jh.dtb \
    am572x-idk-lcd-osd101t2587-jh.dtb \
    am574x-idk-jailhouse.dtb \
    am571x-idk-pps.dtb \
    am572x-idk-pps.dtb \
    am574x-idk-pps.dtb \
"

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

KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-pru-adc.dtb \
                                   am335x-icev2-prueth-pps.dtb"
KERNEL_DEVICETREE_append_ti43x = " am437x-idk-pps.dtb"
KERNEL_DEVICETREE_append_k2g   = " keystone-k2g-ice-pps.dtb"

KERNEL_DEVICETREE_append_am57xx-evm = " ${AM57XX_KERNEL_DEVICETREE}"
KERNEL_DEVICETREE_append_am57xx-hs-evm = " ${AM57XX_KERNEL_DEVICETREE}"

RDEPENDS_kernel-base_append_ti33x = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_ti43x = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_am57xx-hs-evm = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_k2g = " pruhsr-fw pruprp-fw"

RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
