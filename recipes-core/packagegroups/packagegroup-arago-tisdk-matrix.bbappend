PR_append = "-tisdk4"

MATRIX_SGX_DEMOS_omap-a15 = " \
    matrix-3d-demo-chameleon \
    matrix-3d-demo-coverflow \
    matrix-3d-demo-navigation \
    matrix-3d-demo-exampleui \
"

MATRIX_APPS_remove_omap-a15 = "matrix-multimedia-demo-h264dec"
MATRIX_APPS_remove_omap-a15 = "matrix-multimedia-demo-mpeg4aacdec"
MATRIX_APPS_remove_omap-a15 = "matrix-multimedia-demo-mpeg4dec"

MATRIX_APPS_append_omap-a15 = " \
    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264enc','',d)} \
    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec','',d)} \
    matrix-3d-demo-kmscube \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_APPS_append_dra7xx = "        \
    matrix-opencl-demo-dsplibfft        \
    matrix-opencl-demo-vecadd           \
"
