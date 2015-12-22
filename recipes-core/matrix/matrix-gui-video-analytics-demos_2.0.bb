DESCRIPTION = "Video Analytics demo descriptions for Matrix v2"
HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"

require recipes-core/matrix/matrix-gui-apps-git.inc

SRCREV = "8383b2f4aacd77bbb3aaccfc02c61ebd8b5540b6"

PR = "${INC_PR}.0"

inherit allarch

S = "${WORKDIR}/git/videoanalytics_apps"

# Make sure video analytics submenu and app images has been installed
VIDEO_ANALYTICS_DEMO_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-videoanalytics"

PACKAGES = "matrix-video-analytics-opencv-opencl-opengl-demo  \
"

RDEPENDS_matrix-video-analytics-opencv-opencl-opengl-demo     = "${VIDEO_ANALYTICS_DEMO_RDEPENDS}"

# Split the matrix files by demos
FILES_matrix-video-analytics-opencv-opencl-opengl-demo     = "${MATRIX_APP_DIR}/videoanalytics_opencv_opencl_opengl_demo/*"
