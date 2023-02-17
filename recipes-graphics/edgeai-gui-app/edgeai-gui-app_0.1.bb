DESCRIPTION = "EdgeAI GUI Application"
HOMEPAGE = "https://git.ti.com/cgit/apps/edgeai-gui-app"
SECTION = "graphics"

LICENSE = "TI-TSPA"

LIC_FILES_CHKSUM = "file://LICENSE;md5=5c3a7f5f6886ba6f33ec3d214dc7ab4c"

DEPENDS = "qtbase qtquick3d qtmultimedia"
RDEPENDS_${PN} = "qtbase qtquick3d qtmultimedia"

BRANCH = "master"
SRCREV = "a908033a35c9950e62d208257aa99c0e2d18a5ba"

SRC_URI = "git://git.ti.com/apps/edgeai-gui-app.git;protocol=git;branch=${BRANCH} \
           file://edgeai-gui-app.sh \
"

S = "${WORKDIR}/git"

inherit qmake5 deploy update-rc.d

do_install_append () {
    install -d ${D}${bindir}
    install -m 0755 edgeai-gui-app ${D}${bindir}/edgeai-gui-app

    install -d ${D}${sysconfdir}/init.d
    install -m 755 ${WORKDIR}/edgeai-gui-app.sh ${D}${sysconfdir}/init.d/edgeai-gui-app.sh
}

INITSCRIPT_NAME="edgeai-gui-app.sh"

FILES_${PN} += "${bindir}/edgeai-gui-app ${sysconfdir}/init.d/edgeai-gui-app.sh"

