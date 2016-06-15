PR_append = ".tisdk13"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.4:${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-ARM-dts-keystone-evm-add-DT-bindings-for-debugss-and.patch \
    file://0002-ti_config_fragments-connectivity-enable-usb-serial-o.patch \
    file://0003-soc-ti-qmss-fix-error-in-shared-access-of-QMSS-INTD-.patch \
    file://0004-ARM-dts-keystone-use-syscon-regmap-to-enable-shared-.patch \
    file://0005-soc-ti-fix-error-in-set_words-helper.patch \
    file://0006-lib-ktree-add-generic-tree-implementation.patch \
    file://0007-soc-ti-qmss-unmap-descriptors-without-knowing-descri.patch \
    file://0008-net-netcp-support-of-multiple-subqueues-per-interfac.patch \
    file://0009-soc-ti-qmss-add-support-of-queue-range-specific-push.patch \
    file://0010-soc-ti-saving-qmss-clock-in-driver-storage.patch \
    file://0011-ARM-dts-keystone-add-qmss-clock-name.patch \
    file://0012-soc-qmss-support-of-loading-different-types-of-firmw.patch \
    file://0013-soc-ti-add-support-of-loading-qos-firmware.patch \
    file://0014-soc-ti-add-support-of-Quality-of-Service-PDSP.patch \
    file://0015-net-netcp-Add-Keystone-NetCP-QoS-driver.patch \
    file://0016-ARM-dts-keystone-add-qos-support.patch \
    file://0017-ti_config_fragments-connectivity.cfg-Enable-QoS-on-K.patch \
    file://0018-soc-ti-qos-fix-error-in-misspelled-string-when-parsi.patch \
    file://0019-net-netcp-cpts-introduce-keystone-netcp-cpts-softwar.patch \
    file://0020-net-netcp-cpts-update-to-64bit-for-4.4.y.patch \
    file://0021-net-netcp-add-support-of-cpts.patch \
    file://0022-ARM-keystone-dts-add-gbe-and-10gbe-netcp-cpts-bindin.patch \
    file://0023-ti_config_fragments-connectivity.cfg-enable-keystone.patch \
    file://0024-net-netcp-cpts-disable-cpts-time-stamping-using-DT-p.patch \
    file://0025-PCI-keystone-enable-mrrs-quirk-for-K2G-PCIe-device-i.patch \
    file://0026-ARM-dts-k2g-Add-DT-bindings-for-PCIe-controller-driv.patch \
    file://0027-ARM-dts-k2g-enable-DT-bindings-in-EVM-dts-file.patch \
    file://0028-PCI-keystone-Add-error-IRQ-handler.patch \
    file://0029-PCI-keystone-Remove-unnecessary-goto-statement.patch \
    file://0030-ARM-dts-keystone-add-PCI-dt-binding-for-error-interr.patch \
    file://0031-ARM-dts-k2g-add-PCI-dt-binding-for-error-interrupt.patch \
    file://0032-soc-ti-add-missing-include-to-knav_dma.h.patch \
    file://0033-arm-move-aes_glue.h-to-the-arch-arm-include-asm-dire.patch \
    file://0034-Documentation-devicetree-bindings-arm-keystone-keyst.patch \
    file://0035-crypto-add-stub-keystone-crypto-accelerator-driver.patch \
    file://0036-crypto-ks2-add-SA-crypto-accelerator-definitions.patch \
    file://0037-crypto-ks2-read-driver-configuration-parameters-from.patch \
    file://0038-crypto-ks2-add-dma-resources-allocation-code.patch \
    file://0039-crypto-ks2-add-low-level-crypto-hardware-interface-c.patch \
    file://0040-crypto-ks2-add-reworked-SG-list-copy-routines.patch \
    file://0041-crypto-ks2-add-command-label-functions.patch \
    file://0042-crypto-ks2-add-processing-functions-and-aead-algorit.patch \
    file://0043-ARM-dts-k2hk-add-device-binding-for-crypto-accelerat.patch \
    file://0044-ARM-dts-k2l-add-device-binding-for-crypto-accelerato.patch \
    file://0045-ARM-dts-k2e-add-device-binding-for-crypto-accelerato.patch \
    file://0046-crypto-keystone-add-driver-statistics.patch \
    file://0047-crypto-keystone-Add-support-for-HW-RNG.patch \
    file://0048-ti_config_fragments-baseport.cfg-disable-RT_GROUP_SC.patch \
"

RDEPENDS_kernel-base_append_keystone = " netcp-sa-fw"
