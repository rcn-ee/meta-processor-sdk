PR_append = ".tisdk0"

SRCREV = "e6651c1a79b5949817b09e06cc36d828fed8ff3e"

# List of submenus to build packages for
SUBMENUS += " touch_submenu" 
PACKAGES += " ${PN}-touch"

FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
