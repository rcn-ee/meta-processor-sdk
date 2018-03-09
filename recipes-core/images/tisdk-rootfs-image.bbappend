PR_append = ".tisdk5"

IMAGE_INSTALL_append_ti43x = " \
	packagegroup-arago-tisdk-graphics \
	packagegroup-arago-tisdk-hmi \
	packagegroup-ros-world \
	packagegroup-ros-ti \
"
IMAGE_INSTALL_append_ti33x = " \
	packagegroup-arago-tisdk-graphics \
	packagegroup-arago-tisdk-hmi \
	packagegroup-ros-world \
	packagegroup-ros-ti \
"


IMAGE_INSTALL_append_omap-a15 = " \
	packagegroup-arago-tisdk-hmi \
	packagegroup-ros-world \
	packagegroup-ros-ti \
"
