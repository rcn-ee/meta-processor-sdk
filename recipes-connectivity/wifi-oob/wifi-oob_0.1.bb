DESCRIPTION = "WiFi out-of-box experience launcher"

LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "r1"

SYSTEMD_SERVICE_${PN} = "startwlanap.service startwlansta.service"

PACKAGE_ARCH = "${MACHINE_ARCH}"

FILESEXTRAPATHS_prepend := "${THISDIR}/wifi-oob:"

SRC_URI= " \
    file://startwlanap.sh \
    file://startwlanap.service \
    file://01-wlan1-static.network \
    file://startwlansta.service \
    file://startwlansta.sh \
    file://wificfg \
"

FILES_${PN} += "${datadir}/wl18xx/"

inherit systemd deploy

do_install() {
    install -d ${D}/${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/01-wlan1-static.network ${D}/${sysconfdir}/systemd/network

    install -d ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/startwlanap.sh ${D}/${sysconfdir}/init.d
    
    install -m 0755 ${WORKDIR}/startwlansta.sh ${D}/${sysconfdir}/init.d
    install -d ${D}/${sysconfdir}/init.d

    install -d ${D}/${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/startwlanap.service ${D}/${systemd_system_unitdir}
    
    install -d ${D}/${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/startwlansta.service ${D}/${systemd_system_unitdir}
 
    install -d ${D}/${datadir}/wl18xx/
    install -m 0755 ${WORKDIR}/wificfg ${D}/${datadir}/wl18xx/
}

do_deploy() {
    install -d ${DEPLOYDIR}/
    install -m 0755 ${WORKDIR}/wificfg ${DEPLOYDIR}/
}

addtask deploy after do_compile
