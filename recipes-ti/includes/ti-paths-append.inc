require recipes-ti/includes/ti-paths.inc

export CG_XML_INSTALL_DIR_RECIPE          = "${installdir}/ti-cg-xml-tree"
export CCSv6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
export A15_TOOLCHAIN_INSTALL_DIR_RECIPE   = "${installdir}/gcc-arm-none-eabi"
export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"

export NDK_INSTALL_DIR             = "${STAGING_DIR_TARGET}${NDK_INSTALL_DIR_RECIPE}"
export CG_XML_INSTALL_DIR          = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
export CCSv6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSv6_INSTALL_DIR_RECIPE}"
export A15_TOOLCHAIN_INSTALL_DIR   = "${STAGING_DIR_NATIVE}${A15_TOOLCHAIN_INSTALL_DIR_RECIPE}"
export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
