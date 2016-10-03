PR_append = ".tisdk40"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-ARM-dts-keystone-evm-add-DT-bindings-for-debugss-and.patch \
    file://0002-soc-ti-qmss-fix-error-in-shared-access-of-QMSS-INTD-.patch \
    file://0003-ARM-dts-keystone-use-syscon-regmap-to-enable-shared-.patch \
    file://0004-soc-ti-fix-error-in-set_words-helper.patch \
    file://0005-lib-ktree-add-generic-tree-implementation.patch \
    file://0006-soc-ti-qmss-unmap-descriptors-without-knowing-descri.patch \
    file://0007-net-netcp-support-of-multiple-subqueues-per-interfac.patch \
    file://0008-soc-ti-qmss-add-support-of-queue-range-specific-push.patch \
    file://0009-soc-ti-saving-qmss-clock-in-driver-storage.patch \
    file://0010-ARM-dts-keystone-add-qmss-clock-name.patch \
    file://0011-soc-qmss-support-of-loading-different-types-of-firmw.patch \
    file://0012-soc-ti-add-support-of-loading-qos-firmware.patch \
    file://0013-soc-ti-add-support-of-Quality-of-Service-PDSP.patch \
    file://0014-net-netcp-Add-Keystone-NetCP-QoS-driver.patch \
    file://0015-ARM-dts-keystone-add-qos-support.patch \
    file://0016-ti_config_fragments-connectivity.cfg-Enable-QoS-on-K.patch \
    file://0017-soc-ti-qos-fix-error-in-misspelled-string-when-parsi.patch \
    file://0018-net-netcp-cpts-introduce-keystone-netcp-cpts-softwar.patch \
    file://0019-net-netcp-cpts-update-to-64bit-for-4.4.y.patch \
    file://0020-net-netcp-add-support-of-cpts.patch \
    file://0021-ARM-keystone-dts-add-gbe-and-10gbe-netcp-cpts-bindin.patch \
    file://0022-ti_config_fragments-connectivity.cfg-enable-keystone.patch \
    file://0023-net-netcp-cpts-disable-cpts-time-stamping-using-DT-p.patch \
    file://0024-soc-ti-add-queue-flush-helper-macro.patch \
    file://0025-rapidio-keystone-add-support-of-rapidio.patch \
    file://0026-rapidio-rionet-add-support-of-keystone-rapidio.patch \
    file://0027-ARM-dts-keystone-k2hk-Add-devicetree-bindings-for-SR.patch \
    file://0028-rapidio-keystone-move-RapidIO-kernel-configuration-i.patch \
    file://0029-ti_config_fragments-connectivity.cfg-enable-rapidio-.patch \
    file://0030-net-netcp-pa-enable-pre-classification-support-in-PA.patch \
    file://0031-ARM-dts-k2l-e-disable-pre-classification-feature.patch \
    file://0032-net-netcp-pa2-add-pre-classification-support-in-PA-f.patch \
    file://0033-ARM-dts-k2l-k2e-enable-pre-classify-feature.patch \
    file://0034-net-netcp-sa-add-support-for-inflow-crypto-accelerat.patch \
    file://0035-arm-dts-k2hk-add-dts-node-for-netcp-sa-driver.patch \
    file://0036-arm-dts-k2l-add-dts-node-for-netcp-sa-driver.patch \
    file://0037-arm-dts-k2e-add-dts-node-for-netcp-sa-driver.patch \
    file://0038-ARM-dts-am57-evm-add-bindings-for-debugss.patch \
    file://0039-phy-core-add-API-to-support-phy-reset.patch \
    file://0040-phy-keystone-updates-to-10gbe-gbe-pcie-serdes-config.patch \
    file://0041-net-netcp-ethss-add-10gbe-serdes-lane-receive-recove.patch \
    file://0042-PCI-keystone-remove-the-invoke-of-serdes-phy-init.patch \
    file://0043-ARM-dts-keystone-update-SerDes-bindings-for-one-PHY-.patch \
    file://0044-phy-keystone-fix-async-abort-during-probe-on-k2g-soc.patch \
    file://0045-ARM-dts-k2l-Fix-serdes-phy-dt-binding-to-restore-net.patch \
    file://0046-ARM-dts-k2g-disable-dma-coherency-for-PCIe.patch \
    file://0047-ARM-dts-keystone-Disable-10gbe-SerDes-lane-nodes-by-.patch \
    file://0048-phy-keystone-add-support-10gbe-mcu-firmware.patch \
    file://0049-ARM-dts-keystone-Add-bindings-for-10gbe-MCU-firmware.patch \
    file://0050-net-netcp-ethss-Do-not-read-10gbe-pcsr-reg-if-no-ser.patch \
    file://0001-export-dmac_flush_range-symbol.patch \
    file://0001-ARM-dts-am57xx-evm-enable-bb2d.patch \
    file://0051-soc-ti-add-missing-include-to-knav_dma.h.patch \
    file://0052-arm-move-aes_glue.h-to-the-arch-arm-include-asm-dire.patch \
    file://0053-Documentation-devicetree-bindings-arm-keystone-keyst.patch \
    file://0054-crypto-add-stub-keystone-crypto-accelerator-driver.patch \
    file://0055-crypto-ks2-add-SA-crypto-accelerator-definitions.patch \
    file://0056-crypto-ks2-read-driver-configuration-parameters-from.patch \
    file://0057-crypto-ks2-add-dma-resources-allocation-code.patch \
    file://0058-crypto-ks2-add-low-level-crypto-hardware-interface-c.patch \
    file://0059-crypto-ks2-add-command-label-functions.patch \
    file://0060-crypto-ks2-add-processing-functions-and-aead-algorit.patch \
    file://0061-ARM-dts-k2hk-add-device-binding-for-crypto-accelerat.patch \
    file://0062-ARM-dts-k2l-add-device-binding-for-crypto-accelerato.patch \
    file://0063-ARM-dts-k2e-add-device-binding-for-crypto-accelerato.patch \
    file://0064-crypto-keystone-add-driver-statistics.patch \
    file://0065-ti_config_fragments-keystone-disable-crypto-tests.patch \
    file://0066-crypto-keystone-save-device-data-to-dev-struct.patch \
    file://0067-crypto-keystone-make-tx-submission-queue-sharable.patch \
    file://0068-arm-dts-k2-set-dma-coherent-for-sa-subsystem.patch \
"

RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw qmss-pdsp-fw"
