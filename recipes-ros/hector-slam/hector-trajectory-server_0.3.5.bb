DESCRIPTION = "hector_trajectory_server  keeps track of tf trajectories extracted from tf data and \
               makes this data accessible via a service and topic"
SECTION = "devel"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://package.xml;beginline=16;endline=16;md5=d566ef916e9dedc494f5f793a6690ba5"

DEPENDS = "cmake-modules tf roscpp hector-nav-msgs nav-msgs hector-map-tools"

require recipes-ros/hector-slam/hector-slam.inc
