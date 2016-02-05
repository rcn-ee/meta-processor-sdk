PR_append = ".tisdk29"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-Added-DT-bindings-for-DebugSS.patch \
    file://0002-opp33xx_data-Enabled-1-GHz-for-2.0-Silicon.patch \
    file://0003-net-netcp-cpts-introduce-keystone-netcp-cpts-softwar.patch \
    file://0004-net-netcp-add-support-of-cpts.patch \
    file://0005-ARM-keystone-dts-add-gbe-and-10gbe-netcp-cpts-bindin.patch \
    file://0006-ti_config_fragments-connectivity.cfg-enable-keystone.patch \
    file://0007-arm-move-aes_glue.h-to-the-arch-arm-include-asm-drie.patch \
    file://0008-soc-ti-add-missing-include-to-knav_dma.h.patch \
    file://0009-crypto-keystone-add-low-level-crypto-hardware-interf.patch \
    file://0010-crypto-keystone-add-crypto-driver-utility-functions.patch \
    file://0011-crypto-keystone-keystone-sideband-crypto-driver.patch \
    file://0012-Documentation-devicetree-bindings-arm-keystone-keyst.patch \
    file://0013-ARM-dts-k2hk-add-device-binding-for-crypto-accelerat.patch \
    file://0014-ARM-dts-k2l-add-device-binding-for-crypto-accelerato.patch \
    file://0015-ARM-dts-k2e-add-device-binding-for-crypto-accelerato.patch \
"

PATCHTOOL = "git"
