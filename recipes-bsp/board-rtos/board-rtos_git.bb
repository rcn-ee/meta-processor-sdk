inherit ti-pdk
require board.inc

DEPENDS_append = "\
    gpio-lld-rtos \
    i2c-lld-rtos \
    icss-emac-lld-rtos \
    pruss-lld-rtos \
    spi-lld-rtos \
    uart-lld-rtos \
    ti-ndk \
"

DEPENDS_append_ti33x = "\
    starterware \
"

DEPENDS_append_ti43x = "\
    starterware \
"

XDCARGS = ""
XDCARGS_ti33x = "evmAM335x icev2AM335x"
XDCARGS_ti43x = "evmAM437x idkAM437x"
XDCARGS_omap-a15 = "evmAM571x evmAM572x idkAM571x idkAM572x"

XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
