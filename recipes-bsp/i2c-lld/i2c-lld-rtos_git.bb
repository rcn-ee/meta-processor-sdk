inherit ti-pdk
require i2c-lld.inc

DEPENDS += "osal-rtos"

XDCARGS = ""
XDCARGS_ti33x = "am335x"
XDCARGS_ti43x = "am437x"
XDCARGS_omap-a15 = "am571x am572x"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
