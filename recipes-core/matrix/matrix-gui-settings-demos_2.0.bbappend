PR_append = ".tisdk0"

SRCREV = "46c5b815c8ffba20410f53c65cff79eb73d3ff15"

PACKAGES =+ "matrix-gui-weston-terminal-demo"

RDEPENDS_matrix-gui-weston-terminal-demo += " \
    matrix-gui-apps-images \
    matrix-gui-submenus-settings \
    am-sysinfo \
"

FILES_matrix-gui-weston-terminal-demo = " \
    ${MATRIX_APP_DIR}/terminal \
"
