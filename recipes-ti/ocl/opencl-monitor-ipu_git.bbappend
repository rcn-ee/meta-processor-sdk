require recipes-ti/ocl/ocl-1.1.15.inc
require recipes-ti/includes/tisdk-paths.inc

DEPENDS_append = " opencl-tidl-fw"

export OCL_TIDL_FW_DIR = "${OCL_TIDL_FW_INSTALL_DIR}"
