LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=52ba99291b03b91058e37115b66edb10"

require transport.inc
inherit ti-pdk

S = "${WORKDIR}/git/ndk/nimu"

DEPENDS += "osal-rtos ti-ndk"

export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
