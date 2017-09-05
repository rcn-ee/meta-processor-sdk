PR_append = ".tisdk2"

SRCREV = "094736065e1a15a49da19ef4c5a100aa763c41d1"

SUBMENUS_append = " \
    hmi_submenu \
"

PACKAGES_append = " \
    ${PN}-hmi \
"

FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"   
