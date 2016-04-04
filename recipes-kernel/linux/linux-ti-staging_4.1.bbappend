PR_append = ".tisdk44"

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
    file://0016-omap2plus_defconfig-Enable-USB_ACM-and-USB_SERIAL-as.patch \
    file://0017-ARM-dts-keystone-evm-add-DT-bindings-for-debugss-and.patch \
    file://0018-net-netcp-use-keystone-specific-ale-driver.patch \
    file://0019-net-netcp-set-proper-ale-revision-mask-for-major-ver.patch \
    file://0020-net-netcp-pa-add-missing-of_node_put-on-bail-out.patch \
    file://0021-net-netcp-ethss-move-sysfs-code-to-a-separate-file.patch \
    file://0022-net-netcp-add-sysfs-control-for-switch-configuration.patch \
    file://0023-net-netcp-cpts-disable-cpts-time-stamping-using-DT-p.patch \
    file://0024-soc-ti-qmss-fix-error-in-shared-access-of-QMSS-INTD-.patch \
    file://0025-ARM-dts-keystone-use-syscon-regmap-to-enable-shared-.patch \
    file://0026-soc-ti-fix-error-in-set_words-helper.patch \
    file://0027-lib-ktree-add-generic-tree-implementation.patch \
    file://0028-soc-ti-qmss-unmap-descriptors-without-knowing-descri.patch \
    file://0029-net-netcp-support-of-multiple-subqueues-per-interfac.patch \
    file://0030-soc-ti-qmss-add-support-of-queue-range-specific-push.patch \
    file://0031-soc-ti-saving-qmss-clock-in-driver-storage.patch \
    file://0032-ARM-dts-keystone-add-qmss-clock-name.patch \
    file://0033-soc-qmss-support-of-loading-different-types-of-firmw.patch \
    file://0034-soc-ti-add-support-of-loading-qos-firmware.patch \
    file://0035-soc-ti-add-support-of-Quality-of-Service-PDSP.patch \
    file://0036-net-netcp-Add-Keystone-NetCP-QoS-driver.patch \
    file://0037-ARM-dts-keystone-add-qos-support.patch \
    file://0038-ti_config_fragments-connectivity.cfg-Enable-QoS-on-K.patch \
    file://0039-ARM-dts-enable-all-dma-channels-for-user-space-LLD-d.patch \
    file://0040-soc-ti-knav_qmss_queue-fix-Linking-RAM-0-Size-regist.patch \
    file://0041-ks2-crypto-fix-tx_dma_desc_cnt-bug.patch \
    file://0042-TEMP-net-prueth-Use-non-IO-safe-memcpy-for-OCMC-RAM-.patch \
    file://0043-TEMP-net-prueth-Reduce-error-console-message-noise.patch \
    file://0044-TEMP-net-prueth-Do-not-stop-kernel-TX-queue.patch \
    file://0045-HACK-ARM-dts-am437x-idk-evm-Add-non-caching-OCMC-RAM.patch \
    file://0046-ARM-dts-am437x-idk-evm-Add-PRUSS-Ethernet-ports.patch \
"

RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
