PR_append = ".tisdk12"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"

require linux-ti-staging-4.9-patches.inc

#KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
#BRANCH = "processor-sdk-linux-rt-04.01.00"
#SRCREV = "c038d21a22548eb8517f0f8c4c77429dbadd8d9a"

SRC_URI_append = " file://jailhouse.cfg"

KERNEL_CONFIG_FRAGMENTS_append_am57xx-evm = " ${WORKDIR}/jailhouse.cfg"

KERNEL_DEVICETREE_append_am57xx-evm = " \
    am572x-evm-jailhouse.dtb \
    am572x-idk-jailhouse.dtb \
    am572x-idk-lcd-osd101t2045-jh.dtb \
    am572x-idk-lcd-osd101t2587-jh.dtb \
    ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb', '', d)} \
"

CMEM_MACHINE_am57xx-evm = "am571x am572x am574x"
CMEM_DEVICETREE_am574x = "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dtb"

SRC_URI_append_dra7xx = " file://am57xx-pru-uio.dtsi"
do_setup_uio_append_dra7xx() {

    if [ "${ENABLE_TI_UIO_DEVICES}" == "1" ]
    then
        dts="am574x-idk-pru-excl-uio.dts"
        dtsi="am57xx-pru-uio.dtsi"
        cp ${S}/arch/arm/boot/dts/am574x-idk.dts ${S}/arch/arm/boot/dts/$dts
        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/dts/$dts
    fi
}

RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
