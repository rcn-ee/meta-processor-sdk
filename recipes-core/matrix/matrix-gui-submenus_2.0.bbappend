PR_append = "-tisdk0"

SRCREV = "a5d5c5620b3b6fd471181d4efbd1bf388f9783ed"

SUBMENUS_append = " \
    opencl_submenu \
"

PACKAGES += "${PN}-opencl"

FILES_${PN}-opencl = "${MATRIX_APP_DIR}/opencl_submenu/*"
