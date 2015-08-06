inherit ti-pdk
require mmcsd-lld.inc

DEPENDS += "edma3-lld-rtos osal-rtos"

export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
