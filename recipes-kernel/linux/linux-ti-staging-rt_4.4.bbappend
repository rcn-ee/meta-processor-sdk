PR_append = ".tisdk55"

# Apply patches on top of ti-linux-kernel
#require linux-ti-staging-4.4-patches.inc

#SRC_URI_append = " ${TI_LINUX_KERNEL_PATCHES}"

# Use proessor-sdk-linux repo with patches already applied
KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
KERNEL_GIT_PROTOCOL = "git"
BRANCH = "processor-sdk-linux-rt-03.03.00"

SRCREV = "55deef79f414e06052c088c6756b5c2572339144"

RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw qmss-pdsp-fw"

KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb"
