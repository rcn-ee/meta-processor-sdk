FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_am62xx-evm = " \
    file://0001-Revert-arm-dts-k3-am625-sk-u-boot-Add-u-boot-tag-to-.patch \
    file://0002-Revert-configs-am62x_evm_a53_defconfig-Enable-config.patch \
"

SRC_URI_append_am62xx-evm-k3r5 = " \
    file://0001-Revert-arm-dts-k3-am625-sk-u-boot-Add-u-boot-tag-to-.patch \
    file://0002-Revert-configs-am62x_evm_a53_defconfig-Enable-config.patch \
"
PR = "r28"
