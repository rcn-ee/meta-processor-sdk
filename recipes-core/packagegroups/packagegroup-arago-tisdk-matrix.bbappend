PR_append = "-tisdk20"

MATRIX_APPS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"

MATRIX_APPS_remove_ti43x = " \
    matrix-gui-apps-dual-camera \
"

MATRIX_APPS_remove_keystone = " \
    matrix-gui-mc-demos \
"

MATRIX_APPS_append_keystone = " \
    matrix-mc-demo-ipc \
"

MATRIX_APPS_append_k2hk-evm = "      \
    matrix-opencl-demo-floatcompute  \
    matrix-opencl-demo-vecadd        \
"

MATRIX_APPS_append_k2l-evm = "       \
    matrix-opencl-demo-floatcompute  \
    matrix-opencl-demo-vecadd        \
"

MATRIX_APPS_append_k2e-evm = "       \
    matrix-opencl-demo-floatcompute  \
    matrix-opencl-demo-vecadd        \
"

MATRIX_APPS_append_dra7xx = " \
   matrix-video-analytics-opencv-opencl-opengl-demo \
"
