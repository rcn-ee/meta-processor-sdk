PR_append = "-tisdk13"

MATRIX_APPS_append_omap-a15 = " \
    matrix-3d-demo-kmscube \
"

MATRIX_APPS_append_dra7xx = "        \
    matrix-opencl-demo-floatcompute  \
    matrix-opencl-demo-vecadd        \
"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"
