LICENSE = "TI-BSD"
LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=52ba99291b03b91058e37115b66edb10"

require transport.inc
inherit ti-pdk

COMPATIBLE_MACHINE = "omap-a15"

S = "${WORKDIR}/git/ndk/nimu"

DEPENDS += "ti-ndk"

export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
