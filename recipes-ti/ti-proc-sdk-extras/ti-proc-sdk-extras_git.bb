DESCRIPTION = "Package containing scripts to develop in the Processor SDK environment"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://${WORKDIR}/setupenv.sh;beginline=1;endline=42;md5=63b7ff779d64573edf14922bc35864bb"

require recipes-ti/includes/ti-paths-append.inc

PR = "r3"

S = "${WORKDIR}"

SRC_URI = "\
    file://setupenv.bat \
    file://setupenv.sh \
    file://makefile \
    file://makefile_am57xx \
    file://create-sdcard.sh \
    file://create_img.sh \
    file://prebuilt-sdcards/evmAM335x/sd_card_files/app \
    file://prebuilt-sdcards/evmAM335x/sd_card_files/MLO \
    file://prebuilt-sdcards/evmAM335x/sd_card_img/sd_card.img.gz;unpack=false \
    file://prebuilt-sdcards/evmAM437x/sd_card_files/app \
    file://prebuilt-sdcards/evmAM437x/sd_card_files/MLO \
    file://prebuilt-sdcards/evmAM437x/sd_card_img/sd_card.img.gz;unpack=false \
    file://prebuilt-sdcards/evmAM572x/sd_card_files/app \
    file://prebuilt-sdcards/evmAM572x/sd_card_files/large.bmp \
    file://prebuilt-sdcards/evmAM572x/sd_card_files/medium.bmp \
    file://prebuilt-sdcards/evmAM572x/sd_card_files/MLO \
    file://prebuilt-sdcards/evmAM572x/sd_card_files/small.bmp \
    file://prebuilt-sdcards/evmAM572x/sd_card_files/tiny.bmp \
    file://prebuilt-sdcards/evmAM572x/sd_card_img/sd_card.img.gz;unpack=false \
"

do_compile() {
    :
}

SDK_SOC = ""
SDK_SOC_ti33x = "am335x"
SDK_SOC_ti43x = "am437x"
SDK_SOC_omap-a15 = "am57xx"

do_install() {
    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/bin

    install -m 0755 setupenv.sh ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -m 0755 setupenv.bat ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -m 0755 create-sdcard.sh ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/bin
    install -m 0755 create_img.sh ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/bin

    sed -i -e "s|__SDK_SOC__|${SDK_SOC}|g" \
        ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/setupenv.sh
    sed -i -e "s|__SDK_SOC__|${SDK_SOC}|g" \
        ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/setupenv.bat
}

do_install_append_ti33x() {
    PREBUILT_DIR=prebuilt-sdcards/evmAM335x

    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_img

    install -m 0755 makefile ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/app ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/MLO ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_img/sd_card.img.gz ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_img
}

do_install_append_ti43x() {
    PREBUILT_DIR=prebuilt-sdcards/evmAM437x

    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_img

    install -m 0755 makefile ${D}${PROC_SDK_INSTALL_DIR_RECIPE}
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/app ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/MLO ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_img/sd_card.img.gz ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_img
}

do_install_append_omap-a15() {
    PREBUILT_DIR=prebuilt-sdcards/evmAM572x

    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -d ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_img

    install -m 0755 makefile_am57xx ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/makefile
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/app ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/large.bmp ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/medium.bmp ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/MLO ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/small.bmp ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_files/tiny.bmp ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_files
    install -m 0755 ${PREBUILT_DIR}/sd_card_img/sd_card.img.gz ${D}${PROC_SDK_INSTALL_DIR_RECIPE}/${PREBUILT_DIR}/sd_card_img
}

FILES_${PN} += "${PROC_SDK_INSTALL_DIR_RECIPE}/*"
