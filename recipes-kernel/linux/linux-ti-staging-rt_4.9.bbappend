PR_append = ".tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"

#require linux-ti-staging-4.9-patches.inc
require tisdk-cmem.inc

KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"

BRANCH = "processor-sdk-linux-rt-04.00.00"
SRCREV = "786e64041bf4d0a479a00e1d70c8e24c5d7eae25"

SRC_URI_append = " file://jailhouse.cfg"

KERNEL_CONFIG_FRAGMENTS_append_am57xx-evm = " ${WORKDIR}/jailhouse.cfg"

KERNEL_DEVICETREE_append_am57xx-evm = " am572x-evm-jailhouse.dtb am572x-idk-jailhouse.dtb"

RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"
