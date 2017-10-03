PR_append = ".tisdk3"

SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5',['init.eglfs','init'][bb.utils.contains('MACHINE_FEATURES','xsgx',True,False,d) or bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)], 'init', d)}"

SRC_URI_remove = " \
           ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', '', d)} \
"

SRC_URI_append = " \
           ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'file://0001-execute_command-X11-Stop-matrix-when-running-a-GUI-d.patch', '', d)} \
"
