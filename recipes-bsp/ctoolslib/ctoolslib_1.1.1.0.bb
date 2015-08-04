DESCRIPTION = "TI CTools Libraries"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://GettingStarted.htm;md5=d2eea20de71d2e8df509fbffe19c6540"

inherit eclipse-plugin

require recipes-ti/includes/ti-paths-append.inc

COMPATIBLE_MACHINE = "omap-a15"
PACKAGE_ARCH = "${MACHINE_ARCH}"

PV = "1_1_1_0"
PR = "r1"

SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1188/7333/GettingStarted.htm;name=gettingstarted;subdir=${PN}-${PV}"

SRC_URI[gettingstarted.md5sum] = "d2eea20de71d2e8df509fbffe19c6540"
SRC_URI[gettingstarted.sha256sum] = "9d8ae64197c555fc86fbbda5847e5f65ee7a16fcb8de8401c16c851d320e573c"

SRC_URI_AETLIB = "https://gforge.ti.com/gf/download/frsrelease/1214/7276/aet_4.14.zip;name=aetlib;subdir=${PN}-${PV}/packages/ti"
SRC_URI[aetlib.md5sum] = "36a2ae6cfc2e6137d6ed64cfdf2314d3"
SRC_URI[aetlib.sha256sum] = "6d944d07616381ff3c2c8f15ccfd6fc0a29bd2d30e9507fb1034a4c29018aef6"

SRC_URI_STMLIB = "https://gforge.ti.com/gf/download/frsrelease/1221/7428/STMLib_5.2.zip;name=stmlib;subdir=${PN}-${PV}/packages/ti"
SRC_URI[stmlib.md5sum] = "36834c2baa19b475e12bfbc2d4965ae2"
SRC_URI[stmlib.sha256sum] = "0ec35064b6a748a411767685cf31b2b6835ee3bc440e0024c17e9e72d1b1d196"

SRC_URI_ETBLIB = "https://gforge.ti.com/gf/download/frsrelease/1227/7434/ETBLib_1.20.zip;name=etblib;subdir=${PN}-${PV}/packages/ti"
SRC_URI[etblib.md5sum] = "aabac122bd43ef45ffb19e49c890e6f3"
SRC_URI[etblib.sha256sum] = "a0d87cf86db40248e656f3536ac859a12c770c73f0a18a4ad1e9bc669246dea0"

SRC_URI_DSPTRACE = "https://gforge.ti.com/gf/download/frsrelease/1216/7334/DSPTraceLib_1.10.zip;name=dsptrace;subdir=${PN}-${PV}/packages/ti"
SRC_URI[dsptrace.md5sum] = "ef7442be751a4aeddce91a193087233d"
SRC_URI[dsptrace.sha256sum] = "acadb59956512764e75680fabc7c7ede8573c3e53584486aa9a379061d2695ee"

SRC_URI_ETMLIB = "https://gforge.ti.com/gf/download/frsrelease/1226/7433/ETMLib_0.6.zip;name=etmlib;subdir=${PN}-${PV}/packages/ti"
SRC_URI[etmlib.md5sum] = "daca851d5498d9a153fee3cce5694371"
SRC_URI[etmlib.sha256sum] = "16326b95284bd8e46a274036b95897816bfbd697b48deadf22633f7735c954a0"

SRC_URI_PMICMILIB = "https://gforge.ti.com/gf/download/frsrelease/1223/7430/PMICMILib_1.3.zip;name=pmicmilib;subdir=${PN}-${PV}/packages/ti"
SRC_URI[pmicmilib.md5sum] = "52048bb1074cd41806743e25390d6948"
SRC_URI[pmicmilib.sha256sum] = "86e0658304d5591e3ba9c77356e9002da6f939481013dece1253d265306e05b1"

SRC_URI_SCILIB = "https://gforge.ti.com/gf/download/frsrelease/1236/7461/SCILib_1.5.zip;name=scilib;subdir=${PN}-${PV}/packages/ti"
SRC_URI[scilib.md5sum] = "131d970c348c30fbd144af338c04303a"
SRC_URI[scilib.sha256sum] = "6e68331f6b1a6aa55afc49ee0854160258ae8c58911b18ece0fa30a028f0abb0"


SRC_URI_append_ti33x = "\
    ${SRC_URI_AETLIB} \
    ${SRC_URI_STMLIB} \
    ${SRC_URI_ETBLIB} \
    ${SRC_URI_DSPTRACE} \
    ${SRC_URI_ETMLIB} \
    ${SRC_URI_PMICMILIB} \
    ${SRC_URI_SCILIB} \
"

SRC_URI_append_ti43x = "\
    ${SRC_URI_AETLIB} \
    ${SRC_URI_STMLIB} \
    ${SRC_URI_ETBLIB} \
    ${SRC_URI_DSPTRACE} \
    ${SRC_URI_ETMLIB} \
    ${SRC_URI_PMICMILIB} \
    ${SRC_URI_SCILIB} \
"

SRC_URI_append_omap-a15 = "\
    ${SRC_URI_AETLIB} \
    ${SRC_URI_STMLIB} \
    ${SRC_URI_ETBLIB} \
    ${SRC_URI_DSPTRACE} \
    ${SRC_URI_ETMLIB} \
    ${SRC_URI_PMICMILIB} \
    ${SRC_URI_SCILIB} \
"

ECLIPSE_PLUGIN_DIR     = "${CTOOLSLIB_INSTALL_DIR_RECIPE}/eclipse"
ECLIPSE_PLUGIN_NAME    = "CTools Library"
ECLIPSE_PLUGIN_RTSC    = "com.ti.ctoolslib"
ECLIPSE_PLUGIN_VERSION = "1.1.1.00"
ECLIPSE_PLUGIN_DESC    = "CTools Library"

ECLIPSE_PLUGIN_PROVIDER  = "Texas Instruments Inc."
ECLIPSE_PLUGIN_DESC_URL  = "http://www.ti.com"
ECLIPSE_PLUGIN_COPYRIGHT = "Copyright Texas Instruments 2015"

ECLIPSE_PLUGIN_ROOT_MACRO = "CTOOLSLIB_INSTALL_DIR"
ECLIPSE_PLUGIN_ROOT       = "../../.."
ECLIPSE_PLUGIN_REPO       = "${ECLIPSE_PLUGIN_ROOT}/packages"
ECLIPSE_PLUGIN_DOCS       = "${ECLIPSE_PLUGIN_ROOT}"
ECLIPSE_FOLDER_PREFIX     = "ctoolslib"
ECLIPSE_ROOT_MACRO        = "CTOOLSLIB_INSTALL_DIR"

do_install() {
    install -d ${D}${CTOOLSLIB_INSTALL_DIR_RECIPE}
    install -m 644 ${S}/GettingStarted.htm ${D}${CTOOLSLIB_INSTALL_DIR_RECIPE}

    install -d ${D}${CTOOLSLIB_INSTALL_DIR_RECIPE}/packages
    cp -r ${S}/packages/. ${D}${CTOOLSLIB_INSTALL_DIR_RECIPE}/packages
}

do_install_append() {
    sourceipk_do_create_srcipk
}

FILES_${PN} = "${CTOOLSLIB_INSTALL_DIR_RECIPE}"

INSANE_SKIP_${PN} = "arch"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "ctoolslib_${PV}"
SRCIPK_SRC_DIR = "${D}${CTOOLSLIB_INSTALL_DIR_RECIPE}"
