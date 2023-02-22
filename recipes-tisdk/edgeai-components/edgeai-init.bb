SUMMARY = "Add a systemd init service to launch Edge AI out-of-box demos"
HOMEPAGE = "https://git.ti.com/cgit/apps/edgeai-gui-app"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


SRC_URI = "file://edgeai-launcher.sh \
           file://edgeai-init.service \
           file://dot.profile \
"

RDEPENDS_${PN} += "edgeai-gst-apps-source edgeai-gui-app wallpaper"

SYSTEMD_SERVICE_${PN} = "edgeai-init.service"

inherit systemd

do_install() {
    install -d ${D}${sysconfdir}/init.d
    install -m 755 ${WORKDIR}/edgeai-launcher.sh ${D}${sysconfdir}/init.d/edgeai-launcher.sh

    install -d ${D}${sysconfdir}/systemd/system
    install -m 0644 ${WORKDIR}/edgeai-init.service ${D}${sysconfdir}/systemd/system
    
    mkdir -p ${D}/home/root
    install -m 0755 ${WORKDIR}/dot.profile ${D}/home/root/.profile
}

FILES_${PN} += " /home/root/.profile"

PR = "r2"

