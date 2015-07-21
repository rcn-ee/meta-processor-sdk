DESCRIPTION = "DSPLIB contains optimized general-purpose signal-processing routines for TI DSPs"
HOMEPAGE = "http://www.ti.com/tool/sprc265"
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://packages/ti/dsplib/dsplib.h;beginline=9;endline=35;md5=17733f9e1100f8a628512f47c4bf676a"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc
require recipes-ti/includes/ti-unpack.inc

PV = "3_4_0_0"
PR = "r0"

SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};name=dsplib"

SRC_URI[dsplib.md5sum] = "66785604729c153dcad5282097dee8bf"
SRC_URI[dsplib.sha256sum] = "e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785ce8"

BINFILE = "dsplib_c66x_${PV}_Linux.bin"
TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
TI_BIN_UNPK_CMDS = ""

do_install() {
    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
}

ALLOW_EMPTY_${PN} = "1"
FILES_${PN}-dev += "${DSPLIB_C66_INSTALL_DIR_RECIPE}"

INSANE_SKIP_${PN}-dev = "arch"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "dsplib_c66x_${PV}"
