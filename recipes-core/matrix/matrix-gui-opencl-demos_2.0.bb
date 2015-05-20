DESCRIPTION = "OpenCL demo descriptions for Matrix v2"
HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"

require recipes-core/matrix/matrix-gui-apps-git.inc

SRCREV = "a5d5c5620b3b6fd471181d4efbd1bf388f9783ed"

PR = "${INC_PR}.0"

inherit allarch

S = "${WORKDIR}/git/opencl_apps"

# Make sure opencl submenu and app images has been installed
OPENCL_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-opencl"

FILES_${PN} += "${MATRIX_BASE_DIR}/*"

PACKAGES = "matrix-opencl-demo-dsplibfft  \
            matrix-opencl-demo-vecadd     \
"

RDEPENDS_matrix-opencl-demo-dsplibfft = "${OPENCL_RDEPENDS}"
RDEPENDS_matrix-opencl-demo-vecadd    = "${OPENCL_RDEPENDS}"

# Split the matrix files by opencl demos
FILES_matrix-opencl-demo-dsplibfft = "${MATRIX_APP_DIR}/opencl_dsplib_fft/*"
FILES_matrix-opencl-demo-vecadd    = "${MATRIX_APP_DIR}/opencl_vecadd/*"


# Split the ${bindir} files by opencl demos
FILES_matrix-opencl-demo-dsplibfft += "${bindir}/runOclDsplibFFT.sh"
FILES_matrix-opencl-demo-vecadd    += "${bindir}/runOclVecadd.sh"
