require recipes-ti/includes/ti-paths.inc

export CG_XML_INSTALL_DIR_RECIPE          = "${installdir}/ti-cg-xml-tree"
export CCSv6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
export A15_TOOLCHAIN_INSTALL_DIR_RECIPE   = "${installdir}/gcc-arm-none-eabi"
export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"

export CG_XML_INSTALL_DIR          = "${STAGING_DIR_TARGET}${CG_XML_INSTALL_DIR_RECIPE}"
export CCSv6_INSTALL_DIR           = "${STAGING_DIR_TARGET}${CCSv6_INSTALL_DIR_RECIPE}"
export A15_TOOLCHAIN_INSTALL_DIR   = "${STAGING_DIR_TARGET}${A15_TOOLCHAIN_INSTALL_DIR_RECIPE}"
export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_TARGET}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
