PR_append = ".tisdk25"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"

#require linux-ti-staging-4.9-patches.inc

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
BRANCH = "processor-sdk-linux-rt-04.03.00"
SRCREV = "2a41936b6415fa3ea6392516132d40c59e5c9266"

SRC_URI_append = " file://jailhouse.cfg"

KERNEL_CONFIG_FRAGMENTS_append_am57xx-evm = " ${WORKDIR}/jailhouse.cfg"

KERNEL_DEVICETREE_append_am57xx-evm = " \
    am572x-evm-jailhouse.dtb \
    am572x-idk-jailhouse.dtb \
    am572x-idk-lcd-osd101t2045-jh.dtb \
    am572x-idk-lcd-osd101t2587-jh.dtb \
    am574x-idk-jailhouse.dtb \
    am571x-idk-pps.dtb \
    am572x-idk-pps.dtb \
"

RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
