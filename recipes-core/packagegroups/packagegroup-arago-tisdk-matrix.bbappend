PR_append = "-tisdk10"

MATRIX_SGX_DEMOS_omap-a15 = " \
    matrix-3d-demo-chameleon \
    matrix-3d-demo-coverflow \
    matrix-3d-demo-navigation \
    matrix-3d-demo-exampleui \
"

MATRIX_APPS_append_omap-a15 = " \
    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
    matrix-multimedia-demo-h265dec \
    matrix-3d-demo-kmscube \
"

MATRIX_APPS_append_dra7xx = "        \
    matrix-opencl-demo-floatcompute  \
    matrix-opencl-demo-vecadd        \
"
