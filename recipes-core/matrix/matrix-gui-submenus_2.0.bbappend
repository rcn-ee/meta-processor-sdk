PR_append = ".tisdk0"

SUBMENUS_append = " led_submenu \
"

PACKAGES += " ${PN}-led \
"

FILES_${PN}-led = "${MATRIX_APP_DIR}/led_submenu/*"
