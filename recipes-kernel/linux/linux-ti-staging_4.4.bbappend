PR_append = ".tisdk60"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:${THISDIR}/files:"

# Apply patches on top of ti-linux-kernel
#require linux-ti-staging-4.4-patches.inc

#SRC_URI_append = " ${TI_LINUX_KERNEL_PATCHES}"

# Use proessor-sdk-linux repo with patches already applied
KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
KERNEL_GIT_PROTOCOL = "git"
BRANCH = "processor-sdk-linux-03.03.00"

SRCREV = "f9f6f0db2d5e4f9d2ff46eb31a5a05276a92ed7d"

RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw qmss-pdsp-fw"
RDEPENDS_kernel-base_append_am57xx-evm = " pruhsr-fw pruprp-fw"

KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb"
