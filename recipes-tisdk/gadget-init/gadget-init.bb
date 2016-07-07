DESCRIPTION = "Units to initialize usb gadgets"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

PR = "r0"

COMPATIBLE_MACHINE = "ti33x"

RDEPENDS_${PN} += "busybox-udhcpd"

SRC_URI = "file://gadget-init.service \
           file://gadget-init.sh \
"

inherit systemd

SYSTEMD_SERVICE_${PN} = "gadget-init.service"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/gadget-init.sh ${D}${bindir}

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/gadget-init.service ${D}${systemd_system_unitdir}
}

RRECOMMENDS_${PN} += "kernel-module-g-multi"
