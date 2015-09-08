inherit ti-pdk
require pcie-lld.inc

COMPATIBLE_MACHINE = "omap-a15"

XDCARGS = ""
XDCARGS_omap-a15 = "am571x am572x"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
