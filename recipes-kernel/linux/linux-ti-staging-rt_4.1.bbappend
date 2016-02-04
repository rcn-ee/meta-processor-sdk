PR_append = ".tisdk7"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.1:${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-Added-DT-bindings-for-DebugSS.patch \
    file://0002-opp33xx_data-Enabled-1-GHz-for-2.0-Silicon.patch \
    file://0004-soc-ti-add-missing-include-to-knav_dma.h.patch \
    file://0005-crypto-keystone-keystone-sideband-crypto-driver.patch \
    file://0006-ARM-dts-k2hk-add-device-binding-for-crypto-accelerat.patch \
    file://0007-ARM-dts-k2l-add-device-binding-for-crypto-accelerato.patch \
    file://0008-ARM-dts-k2e-add-device-binding-for-crypto-accelerato.patch \
    file://0009-net-netcp-cpts-introduce-keystone-netcp-cpts-softwar.patch \
    file://0010-net-netcp-add-support-of-cpts.patch \
    file://0011-ARM-keystone-dts-add-gbe-and-10gbe-netcp-cpts-bindin.patch \
    file://0012-ti_config_fragments-connectivity.cfg-enable-keystone.patch \
"
