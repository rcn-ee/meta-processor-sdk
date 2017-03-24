DESCRIPTION = "TI ICSS-EMAC low level driver tests"

DEPENDS="common-csl-ip-rtos common-csl-ip pruss-lld icss-emac-lld osal"

include icss-emac-lld-01.00.00.inc

PR = "${INC_PR}.1"

COMPATIBLE_MACHINE = "am57xx-evm"

EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=${S} CSL_PATH="${STAGING_DIR_TARGET}/usr/share/ti/ti-pdk-tree/packages/ti/csl""

do_compile () {
#   Build the tests
    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
    oe_runmake clean
    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
}

do_install () {
#   Install the binary
    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x" TARGET="SOC_AM571x"
    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x" TARGET="SOC_AM572x"
}
