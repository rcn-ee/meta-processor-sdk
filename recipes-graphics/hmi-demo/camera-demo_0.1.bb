DESCRIPTION = "Camera Demo Application launcher"

LICENSE = "TI-TSPA"

LIC_FILES_CHKSUM = "file://LICENSE;md5=b427432730a914095e04e12c25413c41"

BRANCH = "master"
SRCREV = "ff67fb7129e24a506315faca18c3595d3d03aba2"

SRC_URI = "git://git.ti.com/apps/hmi-demo.git;protocol=git;branch=${BRANCH} \
"

S = "${WORKDIR}/git"

inherit deploy

do_install_append () {
    install -d ${D}${sysconfdir}/init.d
    install -m 755 ${S}/scripts/start_camera_demo.sh ${D}${sysconfdir}/init.d/start_camera_demo.sh
}

FILES_${PN} += "${sysconfdir}/init.d/start_camera_demo.sh"

