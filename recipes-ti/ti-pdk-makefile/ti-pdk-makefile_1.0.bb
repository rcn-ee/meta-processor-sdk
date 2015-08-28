DESCRIPTION = "Package containing Makefile for TI PDK"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

require recipes-ti/includes/ti-paths-append.inc

# Build the list of component makefiles to put together to build the
# Makefile that goes into the SDK.  For legacy devices the base Makefile
# will be picked up and will contain everything.
#
# It is assumed that the component makefiles follow the naming
# Makefile_$component.  All Makefiles will be part of the SRC_URI to be
# fetched, but only the listed ones will be used to build the final Makefile

SRC_URI = "\
    file://makefile \
    file://makefile_board \
    file://makefile_csl \
    file://makefile_fatfs \
    file://makefile_gpio \
    file://makefile_i2c \
    file://makefile_icss-emac \
    file://makefile_mmcsd \
    file://makefile_nimu-icss \
    file://makefile_pcie \
    file://makefile_pruss \
    file://makefile_sbl \
    file://makefile_starterware \
    file://makefile_spi \
    file://makefile_uart \
    file://makefile_usb \
    file://makefile_osal \
    file://makefile_nimu \
    file://makefile_profiling \
"

PR = "r2"

MAKEFILES = ""

MAKEFILES_append_ti33x = "\
    osal \
    profiling \
    starterware \
    board \
    gpio \
    i2c \
    icss-emac \
    mmcsd \
    pruss \
    spi \
    uart \
    fatfs \
"

MAKEFILES_append_ti43x = "\
    osal \
    profiling \
    starterware \
    board \
    gpio \
    i2c \
    icss-emac \
    mmcsd \
    pruss \
    spi \
    uart \
    usb \
    fatfs \
"

MAKEFILES_append_omap-a15 = "\
    csl \
    profiling \
    osal \
    board \
    gpio \
    i2c \
    icss-emac \
    mmcsd \
    nimu-icss \
    nimu \
    pcie \
    pruss \
    sbl \
    spi \
    uart \
    fatfs \
"

BOARD_DIAG_DEPS = ""
BOARD_ALL_BOARDS = ""

BOARD_DIAG_DEPS_omap-a15 = "csl gpio i2c icss-emac pruss spi uart"
BOARD_ALL_BOARDS_omap-a15 = "idkAM571x idkAM572x evmAM571x evmAM572x"

SBL_DEPS = ""
SBL_BOARDS = ""
SBL_BOOTMODES = ""

SBL_DEPS_omap-a15 = "board_lib uart spi mmcsd fatfs"
SBL_BOARDS_omap-a15 = "idkAM572x"
SBL_BOOTMODES_omap-a15 = "mmcsd qspi"

STARTERWARE_PLATFORM = ""
STARTERWARE_BOOTMODES = ""
STARTERWARE_APPS = ""

STARTERWARE_PLATFORM_ti33x = "am335x-evm"
STARTERWARE_BOOTMODES_ti33x = "uart mmcsd nand mcspi"
STARTERWARE_APPS_ti33x = "lcdc_app_raster mcspi_app_flash"

STARTERWARE_PLATFORM_ti43x = "am437x-evm"
STARTERWARE_BOOTMODES_ti43x = "uart mmcsd nand"
STARTERWARE_APPS_ti43x = "usb_dev_msc_app vpfe_app_capture_display cap_tsc_app grlib_demo_app dss_app_raster qspi_app_flash_writer qspi_app_read_write"

do_install() {
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages

    install ${WORKDIR}/makefile ${D}${PDK_INSTALL_DIR_RECIPE}/packages

    targets=""
    clean_targets=""

    for x in ${MAKEFILES}
    do
        cat ${WORKDIR}/makefile_${x} >> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
        targets="$targets""$x\ "
        clean_targets="$clean_targets""$x""_clean\ "
    done

    if [ "$targets" != "" ]
    then
        sed -i -e "s|__PDK_ALL_TARGETS__|$targets|" ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
        sed -i -e "s|__PDK_CLEAN_TARGETS__|$clean_targets|" ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
    fi

    sed -i -e "s|__BOARD_DIAG_DEPS__|${BOARD_DIAG_DEPS}|g" \
        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
    sed -i -e "s|__BOARD_ALL_BOARDS__|${BOARD_ALL_BOARDS}|g" \
        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile

    sed -i -e "s|__SBL_DEPS__|${SBL_DEPS}|g" \
        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
    sed -i -e "s|__SBL_BOARDS__|${SBL_BOARDS}|g" \
        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
    sed -i -e "s|__SBL_BOOTMODES__|${SBL_BOOTMODES}|g" \
        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile

    sed -i -e "s|__STARTERWARE_PLATFORM__|${STARTERWARE_PLATFORM}|g" \
        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
    sed -i -e "s|__STARTERWARE_BOOTMODES__|${STARTERWARE_BOOTMODES}|g" \
        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
    sed -i -e "s|__STARTERWARE_APPS__|${STARTERWARE_APPS}|g" \
        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
}

PACKAGE_ARCH = "${MACHINE_ARCH}"

FILES_${PN} = "${PDK_INSTALL_DIR_RECIPE}/packages/makefile"
