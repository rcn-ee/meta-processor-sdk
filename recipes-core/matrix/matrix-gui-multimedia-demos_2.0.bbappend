PR_append = ".tisdk2"

SRCREV = "2a1a815834463357f121c4a0b31106f07a31e12a"

PACKAGES += "matrix-multimedia-demo-dsp66imgproc"

RDEPENDS_matrix-multimedia-demo-dsp66imgproc  = "${MULTIMEDIA_RDEPENDS}"
FILES_matrix-multimedia-demo-dsp66imgproc     = "${MATRIX_APP_DIR}/dsp66_multimedia_imgproc/*"
FILES_matrix-multimedia-demo-dsp66imgproc    += "${bindir}/runDsp66ImgProc.sh"
