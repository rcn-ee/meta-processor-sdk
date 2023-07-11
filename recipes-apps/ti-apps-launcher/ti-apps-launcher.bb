PR = "r6"

DESCRIPTION = "ti-apps-launcher service"
HOMEPAGE = "https://github.com/TexasInstruments/ti-apps-launcher"

COMPATIBLE_MACHINE = "am62xx"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/meta-ti-bsp/licenses/TI-TSPA;md5=bb6bc27cd44417c389a180bd62f552a0"

DEPENDS = "qtbase qtquick3d qtmultimedia"
RDEPENDS:${PN} = "qtquick3d qtmultimedia bash"

BRANCH = "master"
SRCREV = "a9064a2513ffe0c6536c38c5feb059c6113490ca"

SRC_URI = " \
    git://github.com/TexasInstruments/ti-apps-launcher.git;protocol=https;branch=${BRANCH} \
    file://ti-apps-launcher.service \
"

S = "${WORKDIR}/git"

APPS_DEFINES = ""
APPS_DEFINES:am62xx = "SOC_AM62"

CONFIG_FILE = ""
CONFIG_FILE:am62xx = "am62xx-evm"

inherit qmake5 deploy systemd

SYSTEMD_PACKAGES = "${PN}"

SYSTEMD_SERVICE:${PN} = "ti-apps-launcher.service"

do_compile:prepend() {
    echo "SOURCES += configs/${CONFIG_FILE}.cpp" >> ${S}/ti-apps-launcher.pro
    echo >> ${S}/ti-apps-launcher.pro
    echo "DEFINES += ${APPS_DEFINES}" >> ${S}/ti-apps-launcher.pro
}

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ti-apps-launcher ${D}${bindir}/ti-apps-launcher

    install -d ${D}/opt
    install -m 0755 ${S}/scripts/* ${D}/opt/ti-apps-launcher/

    install -d ${D}${sysconfdir}/systemd/system
    install -m 0755 ${WORKDIR}/ti-apps-launcher.service ${D}${sysconfdir}/systemd/system/ti-apps-launcher.service
}

FILES:${PN} = " \
    ${bindir}/ti-apps-launcher \
    /opt/ti-apps-launcher/ \
    ${sysconfdir}/systemd/system/ti-apps-launcher.service \
"
