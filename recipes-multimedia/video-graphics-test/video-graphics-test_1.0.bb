DESCRIPTION = "Test applications for video and graphics interface"
HOMEPAGE = "https://git.ti.com/sitara-linux/video-graphics-test"
SECTION = "multimedia"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"

DEPENDS += "libdrm ti-gc320-libs cmem qtdeclarative"

PR = "r2"

BRANCH = "master"
SRCREV = "2db3848cd1047e688ea0a94a987e35a292bcbda9"

SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
"

S = "${WORKDIR}/git"

inherit qt-provider

export SDK_PATH_TARGET='${STAGING_DIR_HOST}'

# use the make targets already created in the Makefile.build files
do_install() {
    install -d ${D}/usr/bin
    install video_graphics_test ${D}/usr/bin/video-graphics-test
}

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
