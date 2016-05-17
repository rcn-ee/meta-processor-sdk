PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-ARM-dts-keystone-evm-add-DT-bindings-for-debugss-and.patch \
    file://0002-ti_config_fragments-connectivity-enable-usb-serial-o.patch \
    file://0003-soc-ti-add-missing-include-to-knav_dma.h.patch \
    file://0004-arm-move-aes_glue.h-to-the-arch-arm-include-asm-dire.patch \
    file://0005-Documentation-devicetree-bindings-arm-keystone-keyst.patch \
    file://0006-ARM-dts-k2hk-add-device-binding-for-crypto-accelerat.patch \
    file://0007-ARM-dts-k2l-add-device-binding-for-crypto-accelerato.patch \
    file://0008-ARM-dts-k2e-add-device-binding-for-crypto-accelerato.patch \
    file://0009-crypto-keystone-add-KS2-SA-crypto-driver.patch \
    file://0010-crypto-keystone-add-driver-statistics.patch \
    file://0011-crypto-keystone-Add-support-for-HW-RNG.patch \
"
