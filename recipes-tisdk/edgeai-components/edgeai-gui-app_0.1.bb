DESCRIPTION = "EdgeAI GUI Application"
HOMEPAGE = "https://git.ti.com/cgit/apps/edgeai-gui-app"
SECTION = "graphics"

LICENSE = "TI-TSPA"

LIC_FILES_CHKSUM = "file://LICENSE;md5=5c3a7f5f6886ba6f33ec3d214dc7ab4c"

DEPENDS = "qtbase qtquick3d qtmultimedia"
RDEPENDS_${PN} = "qtbase qtquick3d qtmultimedia"

BRANCH = "master"
SRCREV = "3baad7684da770375a3f73ff9e75c81f42388581"

SRC_URI = "git://git.ti.com/apps/edgeai-gui-app.git;protocol=git;branch=${BRANCH}"

S = "${WORKDIR}/git"

inherit qmake5

do_install_append () {
    install -d ${D}${bindir}
    install -m 0755 edgeai-gui-app ${D}${bindir}/edgeai-gui-app

    rm -rf ${D}/opt
}

FILES_${PN} += "${bindir}/edgeai-gui-app"

PR = "r1"
