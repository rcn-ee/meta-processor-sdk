FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-arm-dts-k3-am64-sk-EMIF-tool-update-to-v0.08.40-and-.patch \
    file://0002-arm-dts-k3-am64-evm-EMIF-tool-update-to-v0.08.40-for.patch \
"
PR = "r23"
