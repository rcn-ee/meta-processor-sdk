PR_append = ".p3"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.9-patches:"

SRC_URI_append = " ${TI_LINUX_KERNEL_PATCHES}"

TI_LINUX_KERNEL_PATCHES = " \
    file://0001-hsr-add-debugfs-support-for-display-node-list.patch \
    file://0002-hsr-introduce-rx-offload-feature-flags-for-HSR-and-P.patch \
    file://0003-hsr-update-to-support-lre-rx-and-l2-forward-offload.patch \
    file://0004-hsr-add-tx-stats-for-master-interface.patch \
    file://0005-hsr-remove-the-warn_once-for-non-hsr-frame.patch \
    file://0006-hsr-add-address-B-port-in-the-debugfs-print.patch \
    file://0007-hsr-cleanup-to-fix-coding-style-and-checkpatch-issue.patch \
    file://0008-hsr-preparatary-update-for-adding-prp-support.patch \
    file://0009-hsr-rename-functions-to-introduce-prp-protocol-suppo.patch \
    file://0010-hsr-rename-files-to-introduce-prp-protocol-support.patch \
    file://0011-hsr-move-notification-handling-to-a-common-file-for-.patch \
    file://0012-hsr-add-netlink-interface-to-create-prp-device.patch \
    file://0013-prp-add-supervision-frame-generation-and-handling-su.patch \
    file://0014-prp-add-packet-handling-support.patch \
    file://0015-hsr-prp-add-vlan-support.patch \
    file://0016-hsr-prp-Remove-self-node-from-node-table-list-for-qu.patch \
    file://0017-hsr-handle-untagged-frame-at-the-ingress.patch \
    file://0018-prp-offload-LRE-functions-at-RX-to-firmware-hardware.patch \
    file://0019-hsr-prp-fix-uninitialized-variable-compiler-warning.patch \
    file://0020-hsr-prp-fix-protocol-version-number-setting-error.patch \
    file://0021-hsr-Don-t-update-error-count-for-incorrect-lan.patch \
    file://0022-hsr-fix-filling-up-hsr-tag-error.patch \
    file://0023-ARM-dts-am335x-boneblack-spi0-add-spi0-configuration.patch \
    file://0024-ARM-dts-am335x-boneblack-iot-cape-add-custom-device-.patch \
    file://0025-ti_config_fragments-am33xx_only-enable-spidev-module.patch \
    file://0026-arm-Export-__boot_cpu_mode-for-use-in-Jailhouse-driv.patch \
    file://0027-arm-dts-am572x-add-am572x-idk-jailhouse-dts.patch \
    file://0028-arm-dts-am572x-add-am572x-evm-jailhouse-dts.patch \
    file://0029-tiL4.9-AD-HACK-input-touchscreen-edt-ft5x06-fix-driver-autoprobing.patch \
"

KERNEL_DEVICETREE_append_am57xx-evm = " am572x-evm-jailhouse.dtb am572x-idk-jailhouse.dtb"
