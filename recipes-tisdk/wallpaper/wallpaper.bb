DESCRIPTION = "Add wallpaper to filesystem"

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"
SRC_URI = "file://am62a-sk-wallpaper.jpg"

LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://am62a-sk-wallpaper.jpg;md5=c6a7d3aab283459a74a76c03b62dd215"

S = "${WORKDIR}"

SOC_am62axx-evm = "am62a"
WALLPAPER_SK = "${SOC}-sk-wallpaper.jpg"

do_install_append () {
    install -d ${D}/${datadir}/demo
    install -m 644 ${WORKDIR}/${WALLPAPER_SK} ${D}${datadir}/demo/
}

FILES_${PN} += "${sysconfdir}/init.d/start_camera_demo.sh"

FILES_${PN} += " \
    ${datadir}/demo/* \
"

PR_append = ".tisdk0"
