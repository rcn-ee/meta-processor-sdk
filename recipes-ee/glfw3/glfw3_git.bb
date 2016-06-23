SUMMARY = "GLFW cross platform graphics framework"
DESCRIPTION = "A multi-platform library for OpenGL and OpenGLES, window and input"
HOMEPAGE = "http://glfw.org/"
LICENSE = "Zlib & Libpng"
LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f543d41f3829a608a406b713e4e72731"

PV = "3.1.2"
PR = "r0"

BRANCH = "master"
SRC_URI = "git://github.com/glfw/glfw.git;branch=${BRANCH}"
SRCREV = "30306e54705c3adae9fe082c816a3be71963485c"

SRC_URI += "file://0001_xkb_unicode.patch"

DEPENDS = "glib-2.0 virtual/libgles2 virtual/egl weston wayland wayland-native"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

EXTRA_OECMAKE += "-DGLFW_USE_WAYLAND=ON -DGLFW_CLIENT_LIBRARY=glesv2 -DGLFW_BUILD_EXAMPLES=ON -DGFLW_BUILD_TESTS=ON"

FILES_${PN} += "/usr/lib/cmake/*"
