PR_append = ".p12"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.9-patches:"

SRC_URI_append = " ${TI_LINUX_KERNEL_PATCHES}"

TI_LINUX_KERNEL_PATCHES = " \
    file://0001-ARM-dts-am335x-boneblack-spi0-add-spi0-configuration.patch \
    file://0002-ARM-dts-am335x-boneblack-iot-cape-add-custom-device-.patch \
    file://0003-ti_config_fragments-am33xx_only-enable-spidev-module.patch \
    file://0004-arm-Export-__boot_cpu_mode-for-use-in-Jailhouse-driv.patch \
    file://0005-arm-dts-am572x-add-am572x-idk-jailhouse-dts.patch \
    file://0006-arm-dts-am572x-add-am572x-evm-jailhouse-dts.patch \
    file://0007-hsr-add-debugfs-support-for-display-node-list.patch \
    file://0008-hsr-introduce-rx-offload-feature-flags-for-HSR-and-P.patch \
    file://0009-hsr-update-to-support-lre-rx-and-l2-forward-offload.patch \
    file://0010-hsr-add-tx-stats-for-master-interface.patch \
    file://0011-hsr-remove-the-warn_once-for-non-hsr-frame.patch \
    file://0012-hsr-add-address-B-port-in-the-debugfs-print.patch \
    file://0013-hsr-cleanup-to-fix-coding-style-and-checkpatch-issue.patch \
    file://0014-hsr-preparatary-update-for-adding-prp-support.patch \
    file://0015-hsr-rename-functions-to-introduce-prp-protocol-suppo.patch \
    file://0016-hsr-rename-files-to-introduce-prp-protocol-support.patch \
    file://0017-hsr-move-notification-handling-to-a-common-file-for-.patch \
    file://0018-hsr-add-netlink-interface-to-create-prp-device.patch \
    file://0019-prp-add-supervision-frame-generation-and-handling-su.patch \
    file://0020-prp-add-packet-handling-support.patch \
    file://0021-hsr-prp-add-LRE-stats-support.patch \
    file://0022-hsr-prp-improvement-and-fixes-for-lan_id-handling.patch \
    file://0023-hsr-prp-add-vlan-support.patch \
    file://0024-hsr-prp-bail-out-if-skb-data-not-pointing-to-mac-hea.patch \
    file://0025-hsr-prp-add-sanity-check-to-accept-only-configured-p.patch \
    file://0026-hsr-prp-Remove-self-node-from-node-table-list-for-qu.patch \
    file://0027-hsr-handle-untagged-frame-at-the-ingress.patch \
    file://0028-prp-offload-LRE-functions-at-RX-to-firmware-hardware.patch \
    file://0029-prp-fix-LSDU-size-calculation.patch \
    file://0030-hsr-prp-fix-uninitialized-variable-compiler-warning.patch \
    file://0031-hsr-prp-fix-protocol-version-number-setting-error.patch \
    file://0032-hsr-Don-t-update-error-count-for-incorrect-lan.patch \
    file://0033-hsr-prp-fix-debugfs-so-that-multiple-instances-can-b.patch \
    file://0034-hsr-fix-filling-up-hsr-tag-error.patch \
    file://0035-hsr-prp-Fix-misleading-log.patch \
    file://0036-prp-Use-existing-definition-for-VLAN.patch \
    file://0037-net-prueth-Add-TI-PRUSS-Ethernet-driver-support-of-H.patch \
    file://0038-arm-dts-am57xx-idk-common-add-prueth-HSR-PRP-binding.patch \
    file://0039-tmp-prueth-add-debugfs-file-to-show-write-configurat.patch \
    file://0040-prueth-use-constants-for-busy-overflow-bits.patch \
    file://0041-hsr-add-mode-T-support-for-HSR-in-offload-case.patch \
    file://0042-net-prueth-add-support-of-hsr-prp-vlan-pcp-to-rx-que.patch \
    file://0043-arm-dts-am57xx-idk-common-add-support-of-hsr-prp-vla.patch \
    file://0044-prueth-fix-irq-cleanup.patch \
    file://0045-prueth-fix-incorrect-OCMC_RAM_SIZE-in-the-driver.patch \
    file://0046-prp-remove-NETIF_F_HW_L2FW_DOFFLOAD-requirement.patch \
    file://0047-prueth-remove-NETIF_F_HW_L2FW_DOFFLOAD-requirement-f.patch \
    file://0048-hsr-prp-do-sanity-check-for-offload-before-creating-.patch \
    file://0049-prueth-preparatory-patch-to-add-run-time-protocol-ch.patch \
    file://0050-prueth-support-run-time-change-of-protocol-at-pru-Et.patch \
    file://0051-arm-dts-am57xx-allow-mt9t111-support-in-the-default-.patch \
"
