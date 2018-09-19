DESCRIPTION = "hector_nav_msgs contains messages and services used in the hector_slam stack."
SECTION = "devel"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://package.xml;beginline=16;endline=16;md5=d566ef916e9dedc494f5f793a6690ba5"

DEPENDS = "cmake-modules nav-msgs geometry-msgs message-generation"

require recipes-ros/hector-slam/hector-slam.inc
