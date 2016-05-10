PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-ARM-dts-keystone-evm-add-DT-bindings-for-debugss-and.patch \
    file://0002-ti_config_fragments-connectivity-enable-usb-serial-o.patch \
"
