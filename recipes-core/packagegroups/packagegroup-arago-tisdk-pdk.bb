DESCRIPTION = "Task to install low-level drivers and platform libraries for the PDK"
LICENSE = "MIT"
PR = "r1"

inherit packagegroup

COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
PACKAGE_ARCH = "${MACHINE_ARCH}"

PDK_CSL = "common-csl-ip-rtos"

PDK_LLDS = "\
    gpio-lld-rtos \
    i2c-lld-rtos \
    icss-emac-lld-rtos \
    mmcsd-lld-rtos \
    pruss-lld-rtos \
    spi-lld-rtos \
    uart-lld-rtos \
"

PDK_LLDS_append_omap-a15 = "pcie-lld-rtos"

PDK_TRANSPORTS = ""
PDK_TRANSPORTS_append_omap-a15 = "\
    nimu-icss-rtos \
"

PDK_FILESYSTEMS = "\
    fatfs-rtos \
"

PDK_BOARD_SUPPORT = "\
    board-rtos \
"

PDK_STARTERWARE = ""
PDK_STARTERWARE_append_ti33x = "starterware"
PDK_STARTERWARE_append_ti43x = "starterware"

RDEPENDS_${PN} = "\
    ti-pdk-setup \
    ti-pdk-eclipse \
    ${PDK_CSL} \
    ${PDK_LLDS} \
    ${PDK_TRANSPORTS} \
    ${PDK_FILESYSTEMS} \
    ${PDK_BOARD_SUPPORT} \
    ${PDK_STARTERWARE} \
"
