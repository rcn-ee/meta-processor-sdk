inherit ti-pdk
require transport.inc

S = "${WORKDIR}/git/ndk/nimu_icss"

DEPENDS += "ti-ndk pruss-lld-rtos icss-emac-lld-rtos"

export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
