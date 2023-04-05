DESCRIPTION = "Processor-SDK Deep Learning packagegroup"
PR = "r0"

PACKAGE_ARCH = "${MACHINE_ARCH}"
inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = "packagegroup-dl"

DL_PACKAGES = " \
    opencv \
    opencv-dev \
    tensorflow-lite \
"

PYTHON_PACKAGES = " \
   python3-pip \
   python3-pillow \
   python3-pyyaml \
   python3-numpy \
"

RDEPENDS:${PN} = " \
    glib-2.0-dev \
    libpcre-dev \
    cmake \
    yaml-cpp \
    yaml-cpp-dev \
    ${DL_PACKAGES} \
    ${PYTHON_PACKAGES} \
"

