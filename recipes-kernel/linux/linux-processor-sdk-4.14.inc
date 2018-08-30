PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:${THISDIR}/files:"

#require linux-ti-staging-4.14-patches.inc

SRC_URI_append = " file://jailhouse.cfg"

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

KERNEL_DEVICETREE_append_am57xx-evm = " ${AM57XX_KERNEL_DEVICETREE}"
KERNEL_DEVICETREE_append_am57xx-hs-evm = " ${AM57XX_KERNEL_DEVICETREE}"

RDEPENDS_kernel-base_append_ti33x = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_ti43x = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_am57xx-hs-evm = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_k2g = " pruhsr-fw pruprp-fw"

RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
