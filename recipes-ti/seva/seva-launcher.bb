PR = "r1"
SUMMARY = "Seva Launcher Golang Binary"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/meta-ti-bsp/licenses/TI-TSPA;md5=bb6bc27cd44417c389a180bd62f552a0"

COMPATIBLE_MACHINE = "am62xx"
PACKAGE_ARCH = "${MACHINE_ARCH}"

PV = "v1.0.1"

S = "${WORKDIR}"

SRC_URI = " \
    https://github.com/TexasInstruments/seva/releases/download/${PV}/seva-launcher-aarch64;name=launcher \
"

SRC_URI[launcher.sha256sum] = "2e5fe7bdef820839824f85282ad141d1be3b8d6aa2ca146b90806db3935f96a9"

do_install() {
    install -d ${D}/usr/bin
    install -m 0755 ${S}/seva-launcher-aarch64 ${D}/usr/bin/
}

FILES:${PN} = "/usr/bin/seva-launcher-aarch64"
