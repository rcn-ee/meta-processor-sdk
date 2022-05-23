DESCRIPTION = "Imagination PowerVR SDK binaries/examples"
LICENSE = "MIT"

BRANCH = "master"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=402476d9302b00251cc699d23264b191"

SRC_URI = "\
    git://github.com/powervr-graphics/Native_SDK.git;protocol=git;branch=${BRANCH} \
    file://0001-lib-Rename-Linux_armv8_64-to-Linux_aarch64.patch \
"

SRCREV = "adac88fd5b43fe0eee661110714295cc223be1ce"

PR = "r1"

S = "${WORKDIR}/git"
SRC_DIR = "arm"
SRC_DIR_k3 = "armv8_64"

inherit cmake
export https_proxy

EXTRA_OECMAKE += "-DPVR_WINDOW_SYSTEM=Wayland -DCMAKE_LIBRARY_PATH="

do_install () {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    install -d ${D}${bindir}/SGX/demos/Wayland/

    cp ${CP_ARGS} ${WORKDIR}/build/bin/Assets_OpenGLESSkinning ${D}${bindir}/SGX/demos/Wayland/
    cp ${CP_ARGS} ${WORKDIR}/build/bin/OpenGLESSkinning ${D}${bindir}/SGX/demos/Wayland/

    cp ${CP_ARGS} ${WORKDIR}/build/bin/Assets_OpenGLESBinaryShaders ${D}${bindir}/SGX/demos/Wayland/
    cp ${CP_ARGS} ${WORKDIR}/build/bin/OpenGLESBinaryShaders ${D}${bindir}/SGX/demos/Wayland/
}

DEPENDS = "wayland"
RDEPENDS_${PN} = "wayland libegl"

FILES_${PN} += " \
    /opt/img-powervr-sdk/* \
    /usr/bin/SGX/demos/Wayland/* \
"
