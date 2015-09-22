LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://src/qspi/sbl_qspi.h;beginline=1;endline=31;md5=269b656e0e4c45364b72240ef4657080"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc

DEPENDS = "ti-ccsv6-native uart-lld-rtos spi-lld-rtos mmcsd-lld-rtos i2c-lld-rtos fatfs-rtos board-rtos"

PACKAGE_ARCH = "${MACHINE_ARCH}"
COMPATIBLE_MACHINE = "omap-a15"

BRANCH = "master"
SRC_URI = "git://gtgit02.gt.design.ti.com/git/projects/sbl.git;protocol=git;branch=${BRANCH}"

SRCREV = "969d7a2d6bd0b0c610e11801280a4e9d2a4037bb"
PR = "r3"

S = "${WORKDIR}/git"

PARTNO = ""
PARTNO_omap-a15 = "am57xx"

export TOOLCHAIN_PATH_A15 = "${A15_TOOLCHAIN_INSTALL_DIR}"
export CROSS_TOOL_PRFX = "arm-none-eabi-"
export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
LDFLAGS = ""
CFLAGS = ""

export SBL_SRC_DIR= "${S}"
export QSPI_WRTR_SRC_DIR= "${S}"

do_compile() {
    cd build
    ./sbl_${PARTNO}.sh
}

do_install() {
  install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/sbl
  find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/sbl \;
}

FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"

INSANE_SKIP_${PN} = "arch"
