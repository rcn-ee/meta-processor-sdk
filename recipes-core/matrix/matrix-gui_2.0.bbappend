PR_append = "-tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    ${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
"
