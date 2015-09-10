LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=2df5a2a627821fb0ea094284455f9b1b"

require transport.inc
inherit ti-pdk

S = "${WORKDIR}/git/ndk/nimu_icss"

DEPENDS += "ti-ndk pruss-lld-rtos icss-emac-lld-rtos"

export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
