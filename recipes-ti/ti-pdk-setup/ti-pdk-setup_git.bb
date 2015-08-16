DESCRIPTION = "Package containing scripts to setup the PDK development environment"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://pdksetupenv.sh;beginline=1;endline=20;md5=19359852b140a148fd4399d93d26d0e8"

require recipes-ti/includes/ti-paths-append.inc

PR = "r3"

BRANCH = "releases/procsdk_01_xx"
SRCREV = "f59633b9261b79025707db456cb083076c6911fe"
SRC_URI = "git://gtgit02.gt.design.ti.com/git/projects/keystone-2-csl-lld.git;protocol=git;branch=${BRANCH}"

S = "${WORKDIR}/git/ti/release/full/"

SRC_URI_append = "\
    file://API_Documentation-template.html \
    file://API_Documentation_csl.html \
    file://API_Documentation_uart.html \
    file://API_Documentation_gpio.html \
    file://API_Documentation_i2c.html \
    file://API_Documentation_spi.html \
    file://API_Documentation_pruss.html \
    file://API_Documentation_pcie.html \
    file://API_Documentation_icss-emac.html \
    file://API_Documentation_mmcsd.html \
    file://API_Documentation_fatfs.html \
    file://API_Documentation_usb.html \
    file://API_Documentation_osal.html \
"

API_DOC = "csl"
API_DOC_append_ti33x = "\
    uart \
    gpio \
    i2c \
    spi \
    pruss \
    icss-emac \
    mmcsd \
    fatfs \
    osal \
"

API_DOC_append_ti43x = "\
    uart \
    gpio \
    i2c \
    spi \
    pruss \
    icss-emac \
    mmcsd \
    fatfs \
    usb \
    osal \
"

API_DOC_append_omap-a15 = "\
    uart \
    gpio \
    i2c \
    spi \
    pruss \
    pcie \
    icss-emac \
    mmcsd \
    fatfs \
    osal \
"

do_compile() {
    api_table="\n"
    for lld in ${API_DOC}; do
        api_table="$api_table  <li>`cat ${WORKDIR}/API_Documentation_$lld.html`</li>\n"
    done

    cat ${WORKDIR}/API_Documentation-template.html | \
        sed -e "s|__API_TABLE__|$api_table|g" \
        > API_Documentation.html

    sed -i -e "s|__DATE__|`date`|g" API_Documentation.html
}

do_install() {
  install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages

  install -m 0755 armv7setupenv.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdksetupenv.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdksetupenv.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkbuilder.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkbuilder.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkProjectCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkProjectCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 macros.ini ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 API_Documentation.html ${D}${PDK_INSTALL_DIR_RECIPE}/packages
}

FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
