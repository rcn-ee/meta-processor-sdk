DESCRIPTION = "IMGLIB contains optimized general-purpose image/video processing routines for TI DSPs"
HOMEPAGE = "http://www.ti.com/tool/sprc264"
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://packages/ti/imglib/imglib.h;beginline=9;endline=35;md5=17733f9e1100f8a628512f47c4bf676a"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc
require recipes-ti/includes/ti-unpack.inc

PV = "3_1_1_0"
PR = "r0"

SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV}/exports/${BINFILE};name=imglib"

SRC_URI[imglib.md5sum] = "9d64f213e040899048446df5055deeca"
SRC_URI[imglib.sha256sum] = "e331d454b539d5287486ab7d48a3aa5bf42711c091960c3138d11441f4050f60"

BINFILE = "imglib_c66x_${PV}_Linux.bin"
TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
TI_BIN_UNPK_CMDS = ""

do_install() {
    install -d ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
}

ALLOW_EMPTY_${PN} = "1"
FILES_${PN}-dev += "${IMGLIB_C66_INSTALL_DIR_RECIPE}"

INSANE_SKIP_${PN}-dev = "arch"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "imglib_c66x_${PV}"
