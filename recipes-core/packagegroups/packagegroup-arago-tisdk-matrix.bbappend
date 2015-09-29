PR_append = "-tisdk14"

MATRIX_APPS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_APPS_append_dra7xx = "        \
    matrix-opencl-demo-floatcompute  \
    matrix-opencl-demo-vecadd        \
"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"
