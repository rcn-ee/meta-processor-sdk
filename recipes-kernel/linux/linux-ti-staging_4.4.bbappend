PR_append = ".tisdk54"

# Apply patches on top of ti-linux-kernel
require linux-ti-staging-4.4-patches.inc

SRC_URI_append = " ${TI_LINUX_KERNEL_PATCHES}"

RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw qmss-pdsp-fw"

KERNEL_DEVICETREE_append_ti33x = " am335x-boneblack-iot-cape.dtb"
