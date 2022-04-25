DESCRIPTION = "HMI Demo Qt Application launcher"
HOMEPAGE = "https://git.ti.com/cgit/apps/am62x_hmi_demo"
SECTION = "graphics"

LICENSE = "TI-TSPA"

LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"

DEPENDS = "qtbase qtquick3d"
RDEPENDS_${PN} = "qtquick3d"

BRANCH = "master"
SRCREV = "48076d49e65fd86b4ad91384fd8a3b84ed6d6905"

SRC_URI = "git://git.ti.com/apps/am62x_hmi_demo.git;protocol=git;branch=${BRANCH}"

S = "${WORKDIR}/git"

inherit qmake5
inherit deploy

do_install_append () {
    # Install application
    install -d ${D}${bindir}
    install -m 0755 hmi_demo ${D}${bindir}/
}

FILES_${PN} += "${bindir}/hmi_demo"

