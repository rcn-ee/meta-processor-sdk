inherit ti-pdk
require icss-emac-lld.inc

DEPENDS += "osal-rtos pruss-lld-rtos"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
