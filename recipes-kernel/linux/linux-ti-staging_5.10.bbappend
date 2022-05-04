PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"

SRC_URI_append_am64xx-evm = " \
    file://0001-arm64-dts-k3-am642-sk-Enable-WLAN-connected-to-SDHCI.patch \
    file://0001-arm64-dts-k3-am642-sk-Enable-LEDs-connected-to-tpic2.patch \
"
