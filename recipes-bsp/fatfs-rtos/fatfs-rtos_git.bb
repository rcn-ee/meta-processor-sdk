inherit ti-pdk
require fatfs.inc

DEPENDS += "mmcsd-lld-rtos"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
