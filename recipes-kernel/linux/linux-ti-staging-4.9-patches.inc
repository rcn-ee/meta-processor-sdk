PR_append = ".p4"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-ti-staging-4.9-patches:"

SRC_URI_append = " ${TI_LINUX_KERNEL_PATCHES}"

TI_LINUX_KERNEL_PATCHES = " \
    file://0001-ARM-dts-am335x-boneblack-spi0-add-spi0-configuration.patch \
    file://0002-ARM-dts-am335x-boneblack-iot-cape-add-custom-device-.patch \
    file://0003-ti_config_fragments-am33xx_only-enable-spidev-module.patch \
    file://0004-arm-Export-__boot_cpu_mode-for-use-in-Jailhouse-driv.patch \
    file://0005-arm-dts-am572x-add-am572x-idk-jailhouse-dts.patch \
    file://0006-arm-dts-am572x-add-am572x-evm-jailhouse-dts.patch \
    file://0007-HACK-input-touchscreen-edt-ft5x06-fix-driver-autopro.patch \
"

KERNEL_DEVICETREE_append_am57xx-evm = " am572x-evm-jailhouse.dtb am572x-idk-jailhouse.dtb"
