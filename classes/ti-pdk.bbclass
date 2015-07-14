require recipes-ti/includes/ti-paths-append.inc
require recipes-ti/includes/ti-staging.inc

DEPENDS = "ti-xdctools ti-cgt6x-native ti-ccsv6-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos"

S = "${WORKDIR}/git"
B = "${WORKDIR}/build"

get_build_dir_bash() {
  if [ -f ${S}/package.xdc ]
  then
    grep '^package' ${S}/package.xdc | sed -e 's|\[.*$||' | awk '{ print $2 }' | sed -e 's|\.|/|g'
  else
    echo ${S}
  fi
}

export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
export TOOLCHAIN_PATH_A15 = "${A15_TOOLCHAIN_INSTALL_DIR}"
export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
export CROSS_TOOL_PRFX = "arm-none-eabi-"
export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
export PATH := "${PATH}:${CG_XML_INSTALL_DIR}/bin:${CG_XML_INSTALL_DIR}/utils"


do_configure() {
    BUILD_DIR=${B}/`get_build_dir_bash`

    mkdir -p ${BUILD_DIR}
    cp -r ${S}/* ${BUILD_DIR}
    cd ${BUILD_DIR}

    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
}

do_compile() {
    ${XDC_INSTALL_DIR}/xdc .make -PR .
    ${XDC_INSTALL_DIR}/xdc clean -PR .
    TMPDIR=/tmp/${PN} ${XDC_INSTALL_DIR}/xdc release -PR .
}

do_install () {
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
}

FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
