PR_append = ".tisdk0"

SRCREV = "cad105b0c2b75a90f4def523b4fdbd0b6aa2fe8e"

SUBMENUS_append = " led_submenu \
"

PACKAGES += " ${PN}-led \
"

FILES_${PN}-led = "${MATRIX_APP_DIR}/led_submenu/*"
