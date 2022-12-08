DESCRIPTION = "HMI Demo Qt Application launcher"
HOMEPAGE = "https://git.ti.com/cgit/apps/am62x_hmi_demo"
SECTION = "graphics"

LICENSE = "TI-TSPA"

LIC_FILES_CHKSUM = "file://LICENSE;md5=b427432730a914095e04e12c25413c41"

DEPENDS = "qtbase qtquick3d"
RDEPENDS_${PN} = "qtquick3d"

BRANCH = "master"
SRCREV = "306415c7783490a99ec6f4bf3baa2d5f672d4003"

SRC_URI = "git://git.ti.com/apps/hmi-demo.git;protocol=git;branch=${BRANCH} \
           file://hmi_demo.sh \
"

S = "${WORKDIR}/git"

inherit qmake5 deploy update-rc.d

do_install_append () {
    install -d ${D}${bindir}
    install -m 0755 hmi_demo ${D}${bindir}/hmi_demo

    install -d ${D}${sysconfdir}/init.d
    install -m 755 ${WORKDIR}/hmi_demo.sh ${D}${sysconfdir}/init.d/hmi_demo.sh
    install -m 755 ${S}/scripts/start_hmi_matrix.sh ${D}${sysconfdir}/init.d/start_hmi_matrix.sh
    install -m 755 ${S}/scripts/start_3d_demo.sh ${D}${sysconfdir}/init.d/start_3d_demo.sh
}

INITSCRIPT_NAME="hmi_demo.sh"

FILES_${PN} += "${bindir}/hmi_demo ${sysconfdir}/init.d/hmi_demo.sh ${sysconfdir}/init.d/start_hmi_matrix.sh ${sysconfdir}/init.d/start_3d_demo.sh"

