DESCRIPTION = "Chip support library low level interface"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"

require recipes-ti/includes/ti-paths.inc
require recipes-ti/includes/ti-staging.inc

DEPENDS = "ti-xdctools ti-cgt6x-native ti-sysbios"

COMPATIBLE_MACHINE = "dra7xx|keystone"
PACKAGE_ARCH = "${MACHINE_ARCH}"

PR = "r1"

S = "${WORKDIR}/ti/csl"

BRANCH_dra7xx = "releases/PROCESSOR-SDK.01.00.00"
SRCREV_dra7xx = "37c5311ddf289f83b1432a9422816722d264bf55"

BRANCH_keystone = "master"
SRCREV_keystone = "c78867df9165fdf8042fb692fcea776fc0102326"

SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"

export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr"
export XDCCGROOT="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
export XDCPATH="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"

do_configure() {
    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
}

do_compile() {
    ${XDC_INSTALL_DIR}/xdc .make
    ${XDC_INSTALL_DIR}/xdc clean
    ${XDC_INSTALL_DIR}/xdc release
}

do_install () {
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
}

INSANE_SKIP_${PN} = "installed-vs-shipped"
