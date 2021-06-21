PR_append = "-tisdk55"

MATRIX_SGX_DEMOS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"

MATRIX_APPS_append_omap-a15 = " \
    matrix-gui-apps-dual-camera \
    matrix-gui-apps-image-gallery \
"

MATRIX_APPS_append_am64xx-evm = " \
    matrix-gui-led-demos \
"

MATRIX_TOUCH_APPS_keystone = ""
MATRIX_TOUCH_APPS_omapl138 = ""
