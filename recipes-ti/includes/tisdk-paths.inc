require recipes-ti/includes/ti-paths.inc

export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"

export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
export OMP_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
export MPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
