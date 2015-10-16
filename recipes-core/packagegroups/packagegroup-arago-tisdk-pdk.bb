DESCRIPTION = "Task to install low-level drivers and platform libraries for the PDK"
LICENSE = "MIT"
PR = "r3"

COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

PDK_CSL = "common-csl-ip-rtos"

PDK_LLDS = ""

PDK_LLDS_append_ti33x = "\
    gpio-lld-rtos \
    i2c-lld-rtos \
    spi-lld-rtos \
    uart-lld-rtos \
    icss-emac-lld-rtos \
    mmcsd-lld-rtos \
    pruss-lld-rtos \
"

PDK_LLDS_append_ti43x = "\
    gpio-lld-rtos \
    i2c-lld-rtos \
    spi-lld-rtos \
    uart-lld-rtos \
    icss-emac-lld-rtos \
    mmcsd-lld-rtos \
    pruss-lld-rtos \
    usb-lld-rtos
"

PDK_LLDS_append_omap-a15 = "\
    gpio-lld-rtos \
    i2c-lld-rtos \
    spi-lld-rtos \
    uart-lld-rtos \
    icss-emac-lld-rtos \
    mmcsd-lld-rtos \
    pcie-lld-rtos
    pruss-lld-rtos \
"

PDK_TRANSPORTS = ""
PDK_TRANSPORTS_append_ti33x = "\
    nimu-icss-rtos \
    nimu-rtos \
"
PDK_TRANSPORTS_append_ti43x = "\
    nimu-icss-rtos \
    nimu-rtos \
"
PDK_TRANSPORTS_append_omap-a15 = "\
    nimu-icss-rtos \
    nimu-rtos \
"

PDK_FILESYSTEMS = ""
PDK_FILESYSTEMS_append_ti33x = "\
    fatfs-rtos \
"
PDK_FILESYSTEMS_append_ti43x = "\
    fatfs-rtos \
"
PDK_FILESYSTEMS_append_omap-a15 = "\
    fatfs-rtos \
"

PDK_BOARD_SUPPORT = ""
PDK_BOARD_SUPPORT_append_ti33x = "\
    board-rtos \
"
PDK_BOARD_SUPPORT_append_ti43x = "\
    board-rtos \
"
PDK_BOARD_SUPPORT_append_omap-a15 = "\
    board-rtos \
"

PDK_OSAL_LIB = ""
PDK_OSAL_LIB_append_ti33x = "\
    osal-rtos \
"
PDK_OSAL_LIB_append_ti43x = "\
    osal-rtos \
"
PDK_OSAL_LIB_append_omap-a15 = "\
    osal-rtos \
"

PDK_UTILS = ""
PDK_UTILS_append_ti33x = "\
    profiling-rtos \
"
PDK_UTILS_append_ti43x = "\
    profiling-rtos \
"
PDK_UTILS_append_omap-a15 = "\
    profiling-rtos \
"

PDK_STARTERWARE = ""
PDK_STARTERWARE_append_ti33x = " starterware"
PDK_STARTERWARE_append_ti43x = " starterware"

PDK_BOOTLOADER = ""
PDK_BOOTLOADER_append_omap-a15 = " sbl-boot-rtos"

RDEPENDS_${PN} = "\
    ti-pdk-setup \
    ti-pdk-makefile \
    ti-pdk-eclipse \
    ${PDK_CSL} \
    ${PDK_LLDS} \
    ${PDK_TRANSPORTS} \
    ${PDK_FILESYSTEMS} \
    ${PDK_BOARD_SUPPORT} \
    ${PDK_OSAL_LIB} \
    ${PDK_UTILS} \
    ${PDK_STARTERWARE} \
    ${PDK_BOOTLOADER} \
"
