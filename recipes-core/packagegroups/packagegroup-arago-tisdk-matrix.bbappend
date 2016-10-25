PR_append = "-tisdk43"

MATRIX_SGX_DEMOS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"

MATRIX_APPS_append_omap-a15 += " \
    matrix-gui-apps-dual-camera \
    matrix-gui-apps-image-gallery \
    matrix-multimedia-demo-audiocapture \
    matrix-machinevision-demo-barcoderoi \
"

MATRIX_APPS_append_ti43x = " \
    matrix-multimedia-demo-audiocapture \
    matrix-machinevision-demo-barcoderoi \
"

MATRIX_APPS_append_ti33x += " \
    matrix-machinevision-demo-barcoderoi \
"

MATRIX_APPS_append_keystone += " \
    matrix-machinevision-demo-barcoderoi-f2f \
"
