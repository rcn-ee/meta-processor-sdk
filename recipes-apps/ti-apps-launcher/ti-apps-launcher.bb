PR = "r0"

DESCRIPTION = "ti-apps-launcher service"
HOMEPAGE = "https://github.com/sskartheekadivi/ti-apps-launcher"

COMPATIBLE_MACHINE = "am62xx"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/meta-ti-bsp/licenses/TI-TSPA;md5=bb6bc27cd44417c389a180bd62f552a0"

DEPENDS = "qtbase qtquick3d qtmultimedia"
RDEPENDS:${PN} = "qtquick3d qtmultimedia bash"

BRANCH = "master"
SRCREV = "c92761465fbb5d842832b8b8113a0d7fc792bdc8"

SRC_URI = " \
    git://github.com/sskartheekadivi/ti-apps-launcher.git;protocol=https;branch=${BRANCH} \
    file://ti-apps-launcher.service \
"

S = "${WORKDIR}/git"

APPS_DEFINES = ""
APPS_DEFINES:am62xx = "SOC_AM62"

inherit qmake5 deploy systemd

SYSTEMD_PACKAGES = "${PN}"

SYSTEMD_SERVICE:${PN} = "ti-apps-launcher.service"

do_compile:prepend() {
    echo "SOURCES += configs/${MACHINE}.cpp" >> ${S}/ti-apps-launcher.pro
    echo >> ${S}/ti-apps-launcher.pro
    echo "DEFINES += ${APPS_DEFINES}" >> ${S}/ti-apps-launcher.pro
}

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ti-apps-launcher ${D}${bindir}/ti-apps-launcher

    install -d ${D}/opt
    install -m 0755 ${S}/scripts/setup_cameras.sh ${D}/opt/ti-apps-launcher/

    install -d ${D}${sysconfdir}/systemd/system
    install -m 0755 ${WORKDIR}/ti-apps-launcher.service ${D}${sysconfdir}/systemd/system/ti-apps-launcher.service
}

FILES:${PN} = " \
    ${bindir}/ti-apps-launcher \
    /opt/ti-apps-launcher/ \
    ${sysconfdir}/systemd/system/ti-apps-launcher.service \
"
