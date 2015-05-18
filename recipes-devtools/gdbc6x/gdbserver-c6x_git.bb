DESCRIPTION="TI gdb-server to be used with c6xgdb."

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://../debian/copyright;md5=82c616b6c8f9c11c46feaaf8f9a11495"

include gdbc6x.inc

COMPATIBLE_MACHINE = "dra7xx"
PACKAGE_ARCH = "${MACHINE_ARCH}"

PR = "${INC_PR}.0"

require recipes-ti/includes/ti-paths.inc

DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools"

export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
export FC_DIR = "${FC_INSTALL_DIR}"
export TI_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}" 
export XDC_DIR = "${XDC_INSTALL_DIR}"

PLATFORM = ""
PLATFORM_dra7xx = "DRA7xx_PLATFORM"

EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"

PARALLEL_MAKE = ""

S = "${WORKDIR}/git/gdbserver-c6x/src"

do_install() {
    install -d ${D}${datadir}/ti/gdbc6x/include
    install -d ${D}${datadir}/ti/gdbc6x/lib
    cp -f ../include/* ${D}${datadir}/ti/gdbc6x/include
    cp -f ../lib/* ${D}${datadir}/ti/gdbc6x/lib
}

ALLOW_EMPTY_${PN} = "1"

FILES_${PN}-dev += "\
    ${datadir}/ti/gdbc6x \
"

do_configure[noexec] = "1"
do_qa_configure[noexec] = "1"
