DESCRIPTION = "Imagination PowerVR SDK binaries/examples"
LICENSE = "MIT"

SRC_URI = " \
    git://github.com/powervr-graphics/Native_SDK.git;protocol=git;branch=${BRANCH} \
    file://0001-lib-Rename-Linux_armv8_64-to-Linux_aarch64.patch \
"

BRANCH = "master"
SRCREV = "adac88fd5b43fe0eee661110714295cc223be1ce"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=402476d9302b00251cc699d23264b191"

S = "${WORKDIR}/git"
SRC_DIR = "arm"
SRC_DIR:k3 = "armv8_64"

inherit cmake

EXTRA_OECMAKE += " -DPVR_WINDOW_SYSTEM=Wayland -DCMAKE_LIBRARY_PATH="

do_install () {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    install -d ${D}${bindir}/SGX/demos/Wayland/

    cp ${CP_ARGS} ${WORKDIR}/build/bin/Assets_OpenGLESSkinning ${D}${bindir}/SGX/demos/Wayland/
    cp ${CP_ARGS} ${WORKDIR}/build/bin/OpenGLESSkinning ${D}${bindir}/SGX/demos/Wayland/

    cp ${CP_ARGS} ${WORKDIR}/build/bin/Assets_OpenGLESBinaryShaders ${D}${bindir}/SGX/demos/Wayland/
    cp ${CP_ARGS} ${WORKDIR}/build/bin/OpenGLESBinaryShaders ${D}${bindir}/SGX/demos/Wayland/
}

DEPENDS = "wayland"
RDEPENDS:${PN} = "wayland libegl"

FILES:${PN} += " \
    /opt/img-powervr-sdk/* \
    ${bindir}/SGX/demos/Wayland/* \
"

PR = "r0"
