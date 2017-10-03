PR_append = "-tisdk53"

MATRIX_SGX_DEMOS_remove_omap-a15 = " \
    matrix-3d-demo-kmscubevideo \
"

MATRIX_SGX_DEMOS_remove = " \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-3d-demo-kmscube','',d)}      \
"

MATRIX_OPENCL_APPS_remove_dra7xx = " \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-video-analytics-opencv-opencl-opengl-demo','',d)} \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-dlp3dscanner','',d)} \
"

MATRIX_OPENCV_ARM_ONLY_APPS_remove = " \
     ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-barcoderoi','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-simplepeopletracking','',d)} \
"

MATRIX_OPENCV_OPENCL_APPS_remove = " \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-barcoderoi-f2f','',d)} \
"

MATRIX_OPENCV_OPENCL_APPS_remove_omap-a15 = " \
     ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-barcoderoi','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-simplepeopletracking','',d)} \
"
MATRIX_COMMON_APPS_remove = " \
    matrix-gui-oprofile-demos \
"
MATRIX_APPS_append_ti33x = " \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-hmi-demo-evse',d)} \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-hmi-demo-protection-relays',d)} \
"


MATRIX_APPS_append_omap-a15 = " \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-gui-apps-dual-camera',d)} \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-gui-apps-image-gallery',d)} \
    matrix-multimedia-demo-audiocapture \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-hmi-demo-evse',d)} \
"

MATRIX_APPS_append_ti43x = " \
    matrix-multimedia-demo-audiocapture \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-hmi-demo-evse',d)} \
"

MATRIX_APPS_remove_ti43x = " \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-gui-apps-dual-camera','',d)} \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-gui-apps-image-gallery','',d)} \
"

MATRIX_TOUCH_APPS_keystone = ""
MATRIX_TOUCH_APPS_omapl138 = ""
RDEPENDS_${PN}_remove = "        \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx',"${MATRIX_OPENCL_APPS}",'',d)} \
"

RDEPENDS_${PN}_append = "        \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx',"${MATRIX_SGX_DEMOS}",'',d)} \
"

RDEPENDS_${PN}-extra_remove = " \
    ${@bb.utils.contains('MACHINE_FEATURES','xsgx',"${MATRIX_OPENCV_OPENCL_APPS}",'',d)} \
"
