PR_append = ".tisdk0"

SRCREV = "8383b2f4aacd77bbb3aaccfc02c61ebd8b5540b6"

SUBMENUS += " videoanalytics_submenu \
"

PACKAGES += " ${PN}-videoanalytics \
"

FILES_${PN}-videoanalytics = "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
