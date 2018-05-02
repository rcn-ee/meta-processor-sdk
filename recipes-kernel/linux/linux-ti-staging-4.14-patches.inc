PR_append = ".p0"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.14-patches:"

SRC_URI_append = " ${TI_LINUX_KERNEL_PATCHES}"

TI_LINUX_KERNEL_PATCHES = " \
"
