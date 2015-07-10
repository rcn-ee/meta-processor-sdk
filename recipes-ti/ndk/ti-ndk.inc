DESCRIPTION = "TI RTOS_Networking"
HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/index.html"
SECTION = "devel"
LICENSE = "BSD"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc

S = "${WORKDIR}/ndk_${PV}"

SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/${PV}/exports/ndk_${PV}.zip;name=ndkzip"

do_install() {
    install -d ${D}${NDK_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}
}

ALLOW_EMPTY_${PN} = "1"
FILES_${PN}-dev += "${NDK_INSTALL_DIR_RECIPE}"

INSANE_SKIP_${PN}-dev = "arch ldflags staticdev"
