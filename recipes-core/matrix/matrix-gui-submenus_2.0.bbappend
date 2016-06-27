PR_append = ".tisdk0"

SRCREV = "ed86a74da42e90f2ea5e74c3c03d75148da05f4e"

SUBMENUS +=  " machinevision_submenu "

PACKAGES += " ${PN}-machinevision"

FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
