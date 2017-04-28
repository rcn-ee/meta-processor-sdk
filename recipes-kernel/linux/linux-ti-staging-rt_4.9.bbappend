PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:${THISDIR}/files:"

require linux-ti-staging-4.9-patches.inc

SRC_URI_append = " file://jailhouse.cfg"

KERNEL_CONFIG_FRAGMENTS_append_am57xx-evm = " ${WORKDIR}/jailhouse.cfg"
