DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
SECTION = "devel"
LICENSE = "BSD & GPLv2"
LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=9dbb0095cdb8b35508b344aa4f1de333"

PV = "3_31_02_38"
PR = "r0"

SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_win32.zip;name=xdczip"

SRC_URI[xdczip.md5sum] = "e3fbed4aca7766e0b2bab0c8900f8ae8"
SRC_URI[xdczip.sha256sum] = "43b017ca01d50a1c644cc263b32fa274234b1c014340d8ae5f456f27f30f8b47"

S = "${WORKDIR}/xdctools_${PV}_core"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "xdctools_${PV}_core"
