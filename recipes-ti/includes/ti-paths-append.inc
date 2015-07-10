require recipes-ti/includes/ti-paths.inc

export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"

export CG_XML_INSTALL_DIR     = "${STAGING_DIR_TARGET}${CG_XML_INSTALL_DIR_RECIPE}"
