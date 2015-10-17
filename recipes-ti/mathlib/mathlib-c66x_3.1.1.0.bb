DESCRIPTION = "MATHLIB contains optimized general-purpose signal-processing routines for TI DSPs"
HOMEPAGE = "http://www.ti.com/tool/mathlib"
SECTION = "devel"
LICENSE = "BSD-3-Clause"

LIC_FILES_CHKSUM = "file://packages/ti/mathlib/mathlib.h;beginline=9;endline=35;md5=954ed7074e987be574989f985f1897db"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc
require recipes-ti/includes/ti-unpack.inc

COMPATIBLE_MACHINE = "omap-a15|keystone"

PV = "3_1_1_0"
PR = "r1"

SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/mathlib/${PV}/exports/${BINFILE};name=mathlib"

SRC_URI[mathlib.md5sum] = "f3c9ad06dfcea780b5362c57a4bc48b8"
SRC_URI[mathlib.sha256sum] = "85df897c94e8768e9a1f186c21702ed3887d39cda6dc67cb4580fa3f083e8925"

BINFILE = "mathlib_c66x_${PV}_Linux.bin"
TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
TI_BIN_UNPK_CMDS = ""

do_install() {
    install -d ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
}

ALLOW_EMPTY_${PN} = "1"
FILES_${PN}-dev += "${MATHLIB_C66_INSTALL_DIR_RECIPE}"

INSANE_SKIP_${PN}-dev = "arch"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "mathlib_c66x_${PV}"
