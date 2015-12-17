PR_append = ".tisdk0"

PV = "3.3.0.1"

inherit ti-pdk
require recipes-bsp/common-csl-ip/common-csl-ip.inc

DEPENDS_remove = "${PN}"

CSL_GIT_BRANCH_dra7xx = "master"

CSL_SRCREV = "70270a39bbd63cc93fd12e8d9c525b7be3d87c10"
CSL_SRCREV_dra7xx = "70270a39bbd63cc93fd12e8d9c525b7be3d87c10"

XDCARGS_ti33x = "am335x"
XDCARGS_ti43x = "am437x"
XDCARGS_omap-a15 = "am571x am572x"
XDCARGS_k2hk-evm = "k2h k2k"
XDCARGS_k2l-evm = "k2l"
XDCARGS_k2e-evm = "k2e"

do_configure_append() {
    # Create empty makefile
    # If libraries are supported for this device, then this will be overwritten
    cat > ${BUILD_DIR}/makefile << __EOF__
# Nothing to do
all:

__EOF__
}
