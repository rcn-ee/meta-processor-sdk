DESCRIPTION = "TI CG_XML"
HOMEPAGE = "http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/index.htm"
SECTION = "devel"
LICENSE = "BSD"

require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc
require recipes-ti/includes/ti-unpack.inc

PV = "2_41_00"

S = "${WORKDIR}/cg_xml_${PV}"

PACKAGES_class-nativesdk += "${PN}-installer-linux ${PN}-installer-windows"

SRC_URI = "\
    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v${PV}/cg_xml-v${PV}-Linux-x86-Install;name=cgxmlbin_linux \
    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v${PV}/cg_xml-v${PV}-Setup.exe;name=cgxmlbin_windows \
"

LIC_FILES_CHKSUM = "file://cg_xml_${PV}_Manifest.pdf;md5=ba23d76ef3d5ec111b03267105c91bd4"

SRC_URI[cgxmlbin_linux.md5sum] = "9e421f25f6da455b0155570ce0e62628"
SRC_URI[cgxmlbin_linux.sha256sum] = "bbc25f4abe27a8b93bae1d8581c3dee87111c3769c305d086287038ee9038cbf"

SRC_URI[cgxmlbin_windows.md5sum] = "86d09b2e5d22ee9d595a3eb15b0dfdcb"
SRC_URI[cgxmlbin_windows.sha256sum] = "2979a1ff5167e6d3fcff1a525467b832dccd1bc2f951020fc7ebd577390a871a"

BINFILE="cg_xml-v${PV}-Linux-x86-Install"
TI_BIN_UNPK_CMDS=""
TI_BIN_UNPK_ARGS="--prefix ${S} --mode silent"

do_install() {
    install -d ${D}${CG_XML_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}

    # install -m 755 ${WORKDIR}/${BINFILE} ${D}
    # install -m 755 ${WORKDIR}/cg_xml-v${PV}-Setup.exe ${D}
}

FILES_${PN} += "${CG_XML_INSTALL_DIR_RECIPE}"
# FILES_${PN}-installer-linux = "/${BINFILE}"
# FILES_${PN}-installer-windows = "/cg_xml-v${PV}-Setup.exe"

INSANE_SKIP_${PN} = "arch ldflags"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "cg_xml"

BBCLASSEXTEND = "native nativesdk"
