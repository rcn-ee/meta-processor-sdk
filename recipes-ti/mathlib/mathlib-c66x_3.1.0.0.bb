DESCRIPTION = "MATHLIB contains optimized general-purpose signal-processing routines for TI DSPs"
HOMEPAGE = "http://www.ti.com/tool/sprc265"
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://packages/ti/mathlib/mathlib.h;beginline=9;endline=35;md5=17733f9e1100f8a628512f47c4bf676a"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc
require recipes-ti/includes/ti-unpack.inc

PV = "3_1_0_0"
PR = "r0"

SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/mathlib/${PV}/exports/${BINFILE};name=mathlib"

SRC_URI[mathlib.md5sum] = "d72aec950770523d5f96fbfac7baf860"
SRC_URI[mathlib.sha256sum] = "3c799cb4c271a7e5ad66740edef90c538dc99bb372632bdf018a25165515748e"

BINFILE = "mathlib_c66x_${PV}_Linux.bin"
TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
TI_BIN_UNPK_CMDS = ""

do_install() {
    install -d ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
}

ALLOW_EMPTY_${PN} = "1"
FILES_${PN}-dev += "${MATHLIB_C66_INSTALL_DIR_RECIPE}"

#INSANE_SKIP_${PN}-dev = "arch ldflags staticdev"
INSANE_SKIP_${PN}-dev = "arch"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "mathlib_c66x_${PV}"
