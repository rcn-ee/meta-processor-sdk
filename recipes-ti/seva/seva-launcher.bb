PR = "r0"
SUMMARY = "Seva Launcher Golang Binary"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/meta-ti-bsp/licenses/TI-TSPA;md5=bb6bc27cd44417c389a180bd62f552a0"

COMPATIBLE_MACHINE = "am62xx"
PACKAGE_ARCH = "${MACHINE_ARCH}"

PV = "v1.0.0"

S = "${WORKDIR}"

SRC_URI = " \
    https://github.com/TexasInstruments/seva/releases/download/${PV}/seva-launcher-aarch64;name=launcher \
"

SRC_URI[launcher.sha256sum] = "a0921637bf594112a23a1f20d7dac8c1395c955ab415aea46f04c8f2cde3d277"

do_install() {
    install -d ${D}/usr/bin
    install -m 0755 ${S}/seva-launcher-aarch64 ${D}/usr/bin/
}

FILES:${PN} = "/usr/bin/seva-launcher-aarch64"
