SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"

inherit qt-provider

PV = "1.0"
PR = "r0"

BRANCH = "master"
SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"

SRCREV = "ce093e76faddce78dbaa3e22af6d252f57d5f700"

S = "${WORKDIR}/git"

CREATE_SRCIPK = "1"                                                                               
SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"

do_install() {
    install -d ${D}${bindir}
    install -m 755 evse_hmi ${D}${bindir}
}
