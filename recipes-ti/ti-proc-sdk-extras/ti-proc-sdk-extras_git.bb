DESCRIPTION = "Package containing scripts to develop in the Processor SDK environment"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://${WORKDIR}/setupenv.sh;beginline=1;endline=20;md5=764756aee09afbd13aec53a3c45194ae"

require recipes-ti/includes/ti-paths-append.inc

PR = "r1"

S = "${WORKDIR}"

SRC_URI = "\
    file://setupenv.bat \
    file://setupenv.sh \
    file://makefile \
    file://create-sdcard.sh \
    file://create_img.sh \
"

do_compile() {
    :
}

do_install() {
    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/bin

    install -m 0755 setupenv.sh ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -m 0755 setupenv.bat ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -m 0755 makefile ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -m 0755 create-sdcard.sh ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/bin
    install -m 0755 create_img.sh ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/bin
}

FILES_${PN} += "${PROC_SDK_INSTALL_DIR_RECIPE}/*"
