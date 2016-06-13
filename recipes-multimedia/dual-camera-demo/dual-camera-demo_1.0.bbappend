FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PR_append = ".tisdk0"
SRCREV = "9acc9b17da17ae84e3d4d25fb83d4a8e4cf53fd2"

SRC_URI_remove = "file://dual_camera_qt5_omap-a15.sh \
                  file://0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch"

DEMO_SCRIPT_omap-a15 = "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5.sh', 'dual_camera_qt4.sh', d)}"
