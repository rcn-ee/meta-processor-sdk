SUMMARY = "Add an init service for running EdgeAI Init script"

LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI= " \
    file://edgeai-init.service \
    file://dot.profile \
"

RDEPENDS_${PN} += "bash edgeai-apps-source"

SYSTEMD_SERVICE_${PN} = "edgeai-init.service"
FILES_${PN} += "/home/root/.profile"

inherit systemd

do_install() {
    install -d ${D}${sysconfdir}/systemd/system
    install -m 0644 ${WORKDIR}/edgeai-init.service ${D}${sysconfdir}/systemd/system
    
    mkdir -p ${D}/home/root
    install -m 0755 ${WORKDIR}/dot.profile ${D}/home/root/.profile
}

PR = "r0"
