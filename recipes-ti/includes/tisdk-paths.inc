require recipes-ti/includes/arago-paths.inc

export TIOVX_INSTALL_DIR_RECIPE      = "${installdir}/ti-tiovx-lib-tree"
export PROC_SDK_INSTALL_DIR_RECIPE   = "${installdir}/ti-proc-sdk-rtos-tree"
export FFTLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-fftlib-tree"

export TIOVX_INSTALL_DIR      = "${STAGING_DIR_TARGET}${TIOVX_INSTALL_DIR_RECIPE}"
export PROC_SDK_INSTALL_DIR   = "${STAGING_DIR_TARGET}${PROC_SDK_INSTALL_DIR_RECIPE}"
export FFTLIB_INSTALL_DIR     = "${STAGING_DIR_TARGET}${FFTLIB_INSTALL_DIR_RECIPE}"
