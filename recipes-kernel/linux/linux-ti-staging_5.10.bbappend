PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"

SRC_URI_append_am64xx-evm = " \
    file://0001-WiFi-DT-change.patch \
"
