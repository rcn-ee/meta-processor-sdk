PR_append = "-tisdk27"

MATRIX_APPS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"

MATRIX_APPS_append_dra7xx += " \
    matrix-multimedia-demo-dsp66imgproc \
"

MATRIX_APPS_append_keystone += " \
    matrix-multimedia-demo-dsp66imgproc-f2f \
"

MATRIX_APPS_append_k2g-evm = " matrix-opencl-demo-floatcompute \
                               matrix-opencl-demo-vecadd \
"
