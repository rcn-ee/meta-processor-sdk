DESCRIPTION = "TI CG_XML"
HOMEPAGE = "http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/index.htm"
SECTION = "devel"
LICENSE = "BSD"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc
require recipes-ti/includes/ti-unpack.inc

PV = "2_30_00"

S = "${WORKDIR}/cg_cml_${PV}"

PACKAGES_class-nativesdk += "${PN}-installer-linux ${PN}-installer-windows"

#http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v2_30_00/cg_xml-v2_30_00-Linux-x86-Install
SRC_URI = "\
    http://www.sanb.design.ti.com/SDOApps/cg_xml/cg_xml_v${PV}/cg_xml-v${PV}-Linux-x86-Install;name=cgxmlbin_linux \
    http://www.sanb.design.ti.com/SDOApps/cg_xml/cg_xml_v${PV}/cg_xml-v${PV}-Setup.exe;name=cgxmlbin_windows \
"

LIC_FILES_CHKSUM = "file://cg_xml_${PV}_Manifest.pdf;md5=50cbf2725e64e522aea0bb5e112f7995"

SRC_URI[cgxmlbin_linux.md5sum] = "069444a82700a7b2ea54a20198a6b3e3"
SRC_URI[cgxmlbin_linux.sha256sum] = "8dfeebd69b9853233c9f84c2b81b95cd115fdec8d9102ae1e5c641dd20c6876c"

SRC_URI[cgxmlbin_windows.md5sum] = "bfddd1676b155e53c479f44ceaf0e924"
SRC_URI[cgxmlbin_windows.sha256sum] = "ebbbfdd5cbb5817f183da53b10dc1fe50e59e9d9c9c437efe9eaa2b645123c28"

BINFILE="cg_xml-v${PV}-Linux-x86-Install"
TI_BIN_UNPK_CMDS=""
TI_BIN_UNPK_ARGS="--prefix ${S} --mode silent"

do_install() {
    install -d ${D}${CG_XML_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}

    install -m 755 ${WORKDIR}/${BINFILE} ${D}
    install -m 755 ${WORKDIR}/cg_xml-v${PV}-Setup.exe ${D}
}

FILES_${PN} += "${CG_XML_INSTALL_DIR_RECIPE}"
FILES_${PN}-installer-linux = "/${BINFILE}"
FILES_${PN}-installer-windows = "/cg_xml-v${PV}-Setup.exe"

INSANE_SKIP_${PN}-dev = "arch ldflags"

BBCLASSEXTEND = "native nativesdk"
