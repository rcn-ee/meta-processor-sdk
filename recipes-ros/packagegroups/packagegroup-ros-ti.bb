DESCRIPTION = "ros-ti package group"
LICENSE = "MIT"

inherit packagegroup

PR = "r1"

PACKAGES = "${PN}"

RDEPENDS_${PN} = "\
    mmwave-ros-pkg-master \
    serial-ros \
    octomap-server \
    mmwave-ros-autonomous-robotics \
"
