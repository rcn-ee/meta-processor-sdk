DESCRIPTION = "Camera Demo Application launcher"

LICENSE = "TI-TSPA"

LIC_FILES_CHKSUM = "file://LICENSE;md5=b427432730a914095e04e12c25413c41"

BRANCH = "master"
SRCREV = "306415c7783490a99ec6f4bf3baa2d5f672d4003"

SRC_URI = "git://git.ti.com/apps/hmi-demo.git;protocol=git;branch=${BRANCH} \
"

S = "${WORKDIR}/git"

inherit deploy update-rc.d

do_install_append () {
    install -d ${D}${sysconfdir}/init.d
    install -m 755 ${S}/scripts/start_camera_demo.sh ${D}${sysconfdir}/init.d/start_camera_demo.sh
}

INITSCRIPT_NAME="start_camera_demo.sh"

FILES_${PN} += "${sysconfdir}/init.d/start_camera_demo.sh"

