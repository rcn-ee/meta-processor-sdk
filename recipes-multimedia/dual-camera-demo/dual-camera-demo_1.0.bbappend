FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PR_append = ".tisdk1"

BRANCH = "master"
SRCREV = "0a8505e0b1dcb0e6fd5cef4ae13c17ffb63ce3d8"

SRC_URI_remove = "file://dual_camera_qt5_omap-a15.sh \
                  file://0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch"

DEMO_SCRIPT_omap-a15 = "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5.sh', 'dual_camera_qt4.sh', d)}"
