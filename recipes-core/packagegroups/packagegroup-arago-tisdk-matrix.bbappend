PR_append = "-tisdk25"

MATRIX_APPS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"

MATRIX_APPS_append_dra7xx += " \
    matrix-multimedia-demo-dsp66imgproc \
"
