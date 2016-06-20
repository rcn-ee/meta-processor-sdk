PR_append = ".tisdk6"

SRCREV = "374e6c084542c460e2f29ec2b1b0a7558848a1f9"

PACKAGES += "matrix-multimedia-demo-dsp66imgproc matrix-multimedia-demo-dsp66imgproc-f2f"

RDEPENDS_matrix-multimedia-demo-dsp66imgproc  = "${MULTIMEDIA_RDEPENDS}"
FILES_matrix-multimedia-demo-dsp66imgproc     = "${MATRIX_APP_DIR}/dsp66_multimedia_imgproc/*"
FILES_matrix-multimedia-demo-dsp66imgproc    += "${bindir}/runDsp66ImgProc.sh"

RDEPENDS_matrix-multimedia-demo-dsp66imgproc-f2f  = "${MULTIMEDIA_RDEPENDS}"
FILES_matrix-multimedia-demo-dsp66imgproc-f2f     = "${MATRIX_APP_DIR}/dsp66_multimedia_imgproc_f2f/*"
FILES_matrix-multimedia-demo-dsp66imgproc-f2f    += "${bindir}/runDsp66ImgProcSave2File.sh"
