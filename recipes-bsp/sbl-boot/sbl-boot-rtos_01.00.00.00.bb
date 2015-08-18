LICENSE = "TI-BSD"
LIC_FILES_CHKSUM = "file://src/qspi/sbl_qspi.h;beginline=1;endline=31;md5=269b656e0e4c45364b72240ef4657080"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc

DEPENDS = "ti-ccsv6-native uart-lld-rtos spi-lld-rtos mmcsd-lld-rtos i2c-lld-rtos fatfs-rtos board-rtos"

PACKAGE_ARCH = "${MACHINE_ARCH}"
COMPATIBLE_MACHINE = "am57xx-evm"

BRANCH = "master"
SRC_URI = "git://gtgit02.gt.design.ti.com/git/projects/sbl.git;protocol=git;branch=${BRANCH}"

SRCREV = "969d7a2d6bd0b0c610e11801280a4e9d2a4037bb"
PR = "r1"

S = "${WORKDIR}/git"

export TOOLCHAIN_PATH_A15 = "${A15_TOOLCHAIN_INSTALL_DIR}"
export CROSS_TOOL_PRFX = "arm-none-eabi-"
export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
LDFLAGS = ""
CFLAGS = ""

SBL_SRC_OPTS = "SBL_SRC_DIR=${S} SBL_INC_DIR=${S}/board/src SBL_LIB_INC_DIR=${S}/src/rprc SBL_MMCSD_DIR=${S}/src/mmcsd SBL_QSPI_DIR=${S}/src/qspi"

do_compile() {
  make -f makefile_armv7 clean BOARD=idkAM571x ${SBL_SRC_OPTS}
  make -f makefile_armv7 clean BOARD=idkAM572x ${SBL_SRC_OPTS}
  make -f makefile_armv7 clean BOARD=evmAM572x ${SBL_SRC_OPTS}
  make -f makefile_armv7 all BOARD=idkAM571x SOC=AM571x BOOTMODE=qspi ${SBL_SRC_OPTS}
  make -f makefile_armv7 all BOARD=idkAM571x SOC=AM571x BOOTMODE=mmcsd ${SBL_SRC_OPTS}
  make -f makefile_armv7 all BOARD=idkAM572x SOC=AM572x BOOTMODE=qspi ${SBL_SRC_OPTS}
  make -f makefile_armv7 all BOARD=idkAM572x SOC=AM572x BOOTMODE=mmcsd ${SBL_SRC_OPTS}
  make -f makefile_armv7 all BOARD=evmAM572x SOC=AM572x BOOTMODE=mmcsd ${SBL_SRC_OPTS}
}

do_install() {
  install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/sbl
  cp -r ${S}/. ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/sbl
}

FILES_${PN} = "${PDK_INSTALL_DIR_RECIPE}/packages"
