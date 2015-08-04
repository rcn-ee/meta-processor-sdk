inherit ti-pdk
require board.inc

DEPENDS_append = "\
    starterware \
    gpio-lld-rtos \
    i2c-lld-rtos \
    icss-emac-lld-rtos \
    pruss-lld-rtos \
    spi-lld-rtos \
    uart-lld-rtos \
"

XDCARGS_am335x-evm = "evmAM335x icev2AM335x"
XDCARGS_am437x-evm = "evmAM437x idkAM437x"
XDCARGS_am57xx-evm = "evmAM571x evmAM572x idkAM571x idkAM572x"

XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl"
