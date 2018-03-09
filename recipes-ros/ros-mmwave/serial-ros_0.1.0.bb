DESCRIPTION = "This is a cross-platform library for interfacing with rs-232 serial like ports written in C++.."
SECTION = "devel"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://package.xml;md5=0c69818a991bb8e7eb148c23ed2aa801"

DEPENDS = "boost"

SRCREV = "827c4a784dd4fdd35dc391f37ef152eab7c9c9b2"
SRC_URI = "git://github.com/wjwwood/serial.git;branch=master;protocol=git"

S = "${WORKDIR}/git"

inherit catkin
