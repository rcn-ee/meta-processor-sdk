PR_append = "-tisdk5"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    ${@base_contains('DISTRO_FEATURES', 'wayland', 'file://sgx-demos-workaround.patch', '', d)} \
    ${@base_conditional('QT_PROVIDER', 'qt5', 'file://execute_command-Remove-refresh_screen.patch', '', d)} \
"
