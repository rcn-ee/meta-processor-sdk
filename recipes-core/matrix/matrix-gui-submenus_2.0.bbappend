PR_append = ".tisdk0"

SRCREV = "38afccb5335216ececa874cf4cf72a67c4164fc3"

SUBMENUS_append  = " \
                    browser_submenu \
"

PACKAGES += "${PN}-browser \
"

FILES_${PN}-browser = "${MATRIX_APP_DIR}/browser_submenu/*"
