PR_append = ".tisdk5"

SRCREV = "146420a964d93559524c3a7ee57b2104fd3b4fc3"

PACKAGES += "matrix-multimedia-demo-dsp66imgproc matrix-multimedia-demo-dsp66imgproc-f2f"

RDEPENDS_matrix-multimedia-demo-dsp66imgproc  = "${MULTIMEDIA_RDEPENDS}"
FILES_matrix-multimedia-demo-dsp66imgproc     = "${MATRIX_APP_DIR}/dsp66_multimedia_imgproc/*"
FILES_matrix-multimedia-demo-dsp66imgproc    += "${bindir}/runDsp66ImgProc.sh"

RDEPENDS_matrix-multimedia-demo-dsp66imgproc-f2f  = "${MULTIMEDIA_RDEPENDS}"
FILES_matrix-multimedia-demo-dsp66imgproc-f2f     = "${MATRIX_APP_DIR}/dsp66_multimedia_imgproc_f2f/*"
FILES_matrix-multimedia-demo-dsp66imgproc-f2f    += "${bindir}/runDsp66ImgProcSave2File.sh"
