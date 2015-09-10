inherit ti-pdk
require mmcsd-lld.inc

DEPENDS += "edma3-lld-rtos osal-rtos"
DEPENDS_append_ti33x = " starterware"
DEPENDS_append_ti43x = " starterware"

XDCARGS = ""
XDCARGS_ti33x = "am335x"
XDCARGS_ti43x = "am437x"
XDCARGS_omap-a15 = "am571x am572x"

export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
