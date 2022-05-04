FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"

SRC_URI_append_am64xx-evm = " \
    file://0001-arm-dts-k3-am64-sk-EMIF-tool-update-to-v0.08.40-and-.patch \
    file://0002-arm-dts-k3-am64-evm-EMIF-tool-update-to-v0.08.40-for.patch \
"

SRC_URI_append_am64xx-evm-k3r5 = " \
    file://0001-arm-dts-k3-am64-sk-EMIF-tool-update-to-v0.08.40-and-.patch \
    file://0002-arm-dts-k3-am64-evm-EMIF-tool-update-to-v0.08.40-for.patch \
"
PR = "r23"
