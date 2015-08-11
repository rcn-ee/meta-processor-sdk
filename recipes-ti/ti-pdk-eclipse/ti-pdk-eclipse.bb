LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

inherit eclipse-plugin
require ../includes/ti-paths-append.inc

PACKAGE_ARCH = "${MACHINE_ARCH}"

ECLIPSE_PLUGIN_DIR     = "${PDK_INSTALL_DIR_RECIPE}/eclipse"
ECLIPSE_PLUGIN_MACHINE = "${@'${MACHINE}'.replace('-evm','')}"
ECLIPSE_PLUGIN_NAME    = "${ECLIPSE_PLUGIN_MACHINE} PDK"
ECLIPSE_PLUGIN_RTSC    = "com.ti.pdk.${ECLIPSE_PLUGIN_MACHINE}"
ECLIPSE_PLUGIN_VERSION = "1.0.0"
ECLIPSE_PLUGIN_DESC    = "Platform Development Kit"

ECLIPSE_PLUGIN_PROVIDER  = "Texas Instruments Inc."
ECLIPSE_PLUGIN_DESC_URL  = "http://www.ti.com"
ECLIPSE_PLUGIN_COPYRIGHT = "Copyright Texas Instruments 2015"

ECLIPSE_PLUGIN_ROOT_MACRO = "TI_PDK_INSTALL_DIR"
ECLIPSE_PLUGIN_ROOT       = "../../.."
ECLIPSE_PLUGIN_REPO       = "${ECLIPSE_PLUGIN_ROOT}/packages"
ECLIPSE_PLUGIN_DOCS       = "${ECLIPSE_PLUGIN_ROOT}/docs"
ECLIPSE_FOLDER_PREFIX     = "pdk_${ECLIPSE_PLUGIN_MACHINE}"
ECLIPSE_ROOT_MACRO        = "TI_PDK_INSTALL_DIR"

ECLIPSE_PLUGIN_CDOC = "\
    pdk_releasenotes.xml \
    ti-csl.xml \
"

ECLIPSE_PLUGIN_CDOC_append_am335x-evm = "\
    ti-drv-gpio.xml \
    ti-drv-i2c.xml \
    ti-drv-icss_emac.xml \
    ti-drv-mmcsd.xml \
    ti-drv-pruss.xml \
    ti-drv-spi.xml \
    ti-drv-uart.xml \
    ti-fs-fatfs.xml \
    ti-osal.xml \
"

ECLIPSE_PLUGIN_CDOC_append_am437x-evm = "\
    ti-drv-gpio.xml \
    ti-drv-i2c.xml \
    ti-drv-icss_emac.xml \
    ti-drv-mmcsd.xml \
    ti-drv-pruss.xml \
    ti-drv-spi.xml \
    ti-drv-uart.xml \
    ti-drv-usb.xml \
    ti-fs-fatfs.xml \
    ti-osal.xml \
"

ECLIPSE_PLUGIN_CDOC_append_am57xx-evm = "\
    ti-drv-gpio.xml \
    ti-drv-i2c.xml \
    ti-drv-icss_emac.xml \
    ti-drv-mmcsd.xml \
    ti-drv-pcie.xml \
    ti-drv-pruss.xml \
    ti-drv-spi.xml \
    ti-drv-uart.xml \
    ti-fs-fatfs.xml \
    ti-osal.xml \
"
