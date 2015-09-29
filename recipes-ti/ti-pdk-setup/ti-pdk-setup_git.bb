DESCRIPTION = "Package containing scripts to setup the PDK development environment"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://pdksetupenv.sh;beginline=1;endline=20;md5=50fd2da740dc38f10a23efb4a85590e6"

require recipes-ti/includes/ti-paths-append.inc

PR = "r5"

BRANCH = "releases/procsdk_01_xx"
SRCREV = "60e83b94fbe6c9e7f6418ac8e193c7e0e3134516"
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
    file://API_Documentation_profiling.html \
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
    profiling \
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
    profiling \
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
    profiling \
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

  install -m 0755 pdksetupenv.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdksetupenv.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkProjectCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkProjectCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 macros.ini ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 API_Documentation.html ${D}${PDK_INSTALL_DIR_RECIPE}/packages
}

FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
