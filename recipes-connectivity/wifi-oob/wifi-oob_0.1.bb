DESCRIPTION = "WiFi out-of-box experience launcher"

LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "r1"

SYSTEMD_SERVICE_${PN} = "startwlan.service"

PACKAGE_ARCH = "${MACHINE_ARCH}"

FILESEXTRAPATHS_prepend := "${THISDIR}/wifi-oob:"

SRC_URI= " \
    file://startwlan.sh \
    file://startwlan.service \
    file://01-wlan1-static.network \
"

inherit systemd

do_install() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/01-wlan1-static.network ${D}/${sysconfdir}/systemd/network

    install -d ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/startwlan.sh ${D}/${sysconfdir}/init.d

    install -d ${D}/${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/startwlan.service ${D}/${systemd_system_unitdir}
}
