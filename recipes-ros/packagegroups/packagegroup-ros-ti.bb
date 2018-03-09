DESCRIPTION = "ros-ti package group"
LICENSE = "MIT"

inherit packagegroup

PACKAGES = "${PN}"

RDEPENDS_${PN} = "\
    mmwave-ros-pkg-master \
    serial-ros \
    octomap-server \
"
