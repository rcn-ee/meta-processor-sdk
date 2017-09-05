SUMMARY = "HMI demo for Prectection Relays using QT QWidget tools"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"

inherit qt-provider

PV = "1.0"
PR = "r0"

BRANCH = "master"
SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"

SRCREV = "c8764aaba365302090179b6720cbfc994e169842"

S = "${WORKDIR}/git"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"

do_install() {
    install -d ${D}${bindir}
    install -m 755 protection_relays_hmi ${D}${bindir}
}
