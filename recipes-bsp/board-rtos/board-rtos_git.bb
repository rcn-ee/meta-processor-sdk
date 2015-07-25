inherit ti-pdk
require board.inc

DEPENDS_append = "\
    gpio-lld-rtos \
    i2c-lld-rtos \
    icss-emac-lld-rtos \
    pruss-lld-rtos \
    spi-lld-rtos \
    uart-lld-rtos \
"

XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl"
