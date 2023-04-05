DESCRIPTION = "Startup script to resize rootfs to full size"
SUMMARY = "This startup script expands the rootfs partition to full size of the boot device."

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI = " \
    file://resize_rootfs.sh \
    file://LICENSE \
"

COMPATIBLE_MACHINE = "k3"

LICENSE = "TI-TSPA"

LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=b427432730a914095e04e12c25413c41"

inherit deploy update-rc.d

do_install:append() {
    install -d 644 ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/resize_rootfs.sh ${D}${sysconfdir}/init.d/resize_rootfs.sh
}

INITSCRIPT_NAME = "resize_rootfs.sh"

FILES:${PN} += "${sysconfdir}/init.d/resize_rootfs.sh"

PR = "r0"
