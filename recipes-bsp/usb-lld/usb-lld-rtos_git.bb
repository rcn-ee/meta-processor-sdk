inherit ti-pdk
require usb-lld.inc

COMPATIBLE_MACHINE = "ti43x"

DEPENDS += "starterware"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
