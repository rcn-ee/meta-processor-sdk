DESCRIPTION = "Unified Instrumentation Architecture (UIA) defines APIs and transports that allow embedded software to log instrumentation data for use within CCS"
HOMEPAGE = "http://processors.wiki.ti.com/index.php/Multicore_System_Analyzer"
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://${S}/uia.bld;beginline=1;endline=31;md5=a13af1ef589b9c729238391e6e32d6c7"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc

COMPATIBLE_MACHINE = "omap-a15"

PV = "2_00_03_43"
PR = "r0"

SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/uia/${PV}/exports/uia_${PV}.zip;name=uiazip"

SRC_URI[uiazip.md5sum] = "6e352fdfad5c37986844c5186c34cce1"
SRC_URI[uiazip.sha256sum] = "1e07fd3e3f2393db2834f1c72b82d451f08b1172d477fa842c1f401ba9a6521f"

S = "${WORKDIR}/uia_${PV}"

do_compile() {
    :
}

do_install() {
    install -d ${D}${UIA_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${UIA_INSTALL_DIR_RECIPE}
}

FILES_${PN}-dev += "${UIA_INSTALL_DIR_RECIPE}"

INSANE_SKIP_${PN}-dev = "ldflags staticdev"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "uia_${PV}"
SRCIPK_SRC_DIR = "${D}${UIA_INSTALL_DIR_RECIPE}"
