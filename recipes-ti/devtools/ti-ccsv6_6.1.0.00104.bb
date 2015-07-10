DESCRIPTION = "TI DSP Code Generation Tools"
HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"

LIC_FILES_CHKSUM = "file://${WORKDIR}/ccsv6/doc/EULA/EULA.doc;md5=24fb8a52ac52d3938b5888362edb295a"

require recipes-ti/includes/ti-unpack.inc
require recipes-ti/includes/ti-staging.inc
require recipes-ti/includes/ti-paths-append.inc

SRC_URI = "http://software-dl.ti.com/ccs/esd/CCSv6/CCS_6_1_0/exports/CCS${PV}_linux.tar.gz;name=ccsv6"

S = "${WORKDIR}/CCS${PV}_linux"

BINFILE = "CCS${PV}_linux/ccs_setup_${PV}.bin"
TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
TI_BIN_UNPK_CMDS = ""

SRC_URI[ccsv6.md5sum] = "72970262e34399e69403837a4021538e"
SRC_URI[ccsv6.sha256sum] = "89da2ed70a48da5ecef9b9fbbb3612fb6f013e779412def3cddc81bf3c24eaf4"

do_install() {
    install -d ${D}${CCSv6_INSTALL_DIR_RECIPE}
    cp -r ${WORKDIR}/ccsv6/. ${D}${CCSv6_INSTALL_DIR_RECIPE}

    install -d ${D}${A15_TOOLCHAIN_INSTALL_DIR_RECIPE}
    cp -r ${WORKDIR}/ccsv6/tools/compiler/gcc-arm-none-eabi-4_8-2014q3/. \
          ${D}${A15_TOOLCHAIN_INSTALL_DIR_RECIPE}

    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
    cp -r ${WORKDIR}/ccsv6/tools/compiler/ti-cgt-arm_5.2.2/. \
          ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
}

FILES_${PN} += "\
  ${CCSv6_INSTALL_DIR_RECIPE} \
  ${A15_TOOLCHAIN_INSTALL_DIR_RECIPE} \
  ${M4_TOOLCHAIN_INSTALL_DIR_RECIPE} \
"

INSANE_SKIP_${PN} = "arch libdir ldflags staticdev textrel dev-so"

EXCLUDE_FROM_SHLIBS = "1"
