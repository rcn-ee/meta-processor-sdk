DESCRIPTION = "The OctoMap library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++."
SECTION = "devel"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://package.xml;md5=dfb148c57f55603b266f9fd073e6d1b6"

SRC_URI = "git://github.com/OctoMap/octomap_mapping.git;branch=indigo-devel;protocol=git"
SRCREV = "122bc60230925009925c99d8e40c1abea287ebf0"

DEPENDS = "roscpp visualization-msgs sensor-msgs pcl-ros pcl-conversions nav-msgs std-msgs std-srvs octomap-ros octomap-msgs dynamic-reconfigure nodelet rospy python-six python-bson"

DEPENDS += "${PYTHON_PN}-setuptools-native ${PYTHON_PN}-future-native"

S = "${WORKDIR}/git/octomap_server"

EXTRA_OECMAKE += "-DCMAKE_SKIP_RPATH=ON"

inherit catkin
