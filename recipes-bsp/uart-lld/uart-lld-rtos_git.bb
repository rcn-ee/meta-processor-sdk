inherit ti-pdk
require uart-lld.inc

DEPENDS += "edma3-lld-rtos"

export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
