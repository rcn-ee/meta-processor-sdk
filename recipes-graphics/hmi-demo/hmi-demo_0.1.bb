DESCRIPTION = "HMI Demo Qt Application launcher"
HOMEPAGE = "https://git.ti.com/cgit/apps/am62x_hmi_demo"
SECTION = "graphics"

LICENSE = "TI-TSPA"

LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"

DEPENDS = "qtbase qtquick3d"
RDEPENDS_${PN} = "qtquick3d"

BRANCH = "master"
SRCREV = "48076d49e65fd86b4ad91384fd8a3b84ed6d6905"

SRC_URI = "git://git.ti.com/apps/am62x_hmi_demo.git;protocol=git;branch=${BRANCH} \
           file://hmi_demo.sh \
           file://start_hmi_matrix.sh \
           file://start_3d_demo.sh \
           file://0001-hmi-demo-Add-exit-feature-and-smooth-needle-movement.patch \
           file://0002-main.qml-3D-Button-Exit-with-0x3D-ret-value-when-cli.patch"

S = "${WORKDIR}/git"

inherit qmake5 deploy update-rc.d

do_install_append () {
    install -d ${D}${bindir}
    install -m 0755 hmi_demo ${D}${bindir}/hmi_demo

    install -d ${D}${sysconfdir}/init.d
    install -m 755 ${WORKDIR}/hmi_demo.sh ${D}${sysconfdir}/init.d/hmi_demo.sh
    install -m 755 ${WORKDIR}/start_hmi_matrix.sh ${D}${sysconfdir}/init.d/start_hmi_matrix.sh
    install -m 755 ${WORKDIR}/start_3d_demo.sh ${D}${sysconfdir}/init.d/start_3d_demo.sh
}

INITSCRIPT_NAME="hmi_demo.sh"

FILES_${PN} += "${bindir}/hmi_demo ${sysconfdir}/init.d/hmi_demo.sh ${sysconfdir}/init.d/start_hmi_matrix.sh"

