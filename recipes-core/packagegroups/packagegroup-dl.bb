DESCRIPTION = "Processor-SDK Deep Learning packagegroup"
PR = "r1"

PACKAGE_ARCH = "${MACHINE_ARCH}"
inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = "packagegroup-dl"

DL_PACKAGES = " \
    neo-ai-dlr \
    opencv \
    opencv-dev \
    onnxruntime \
    onnxruntime-dev \
    tensorflow-lite \
"

PYTHON_PACKAGES = " \
    python3-pip \
    python3-pillow \
    python3-pyyaml \
    python3-numpy \
    python3-tensorflow-lite \
"

RDEPENDS_${PN} = " \
    glib-2.0-dev \
    libpcre-dev \
    cmake \
    yaml-cpp \
    yaml-cpp-dev \
    ${DL_PACKAGES} \
    ${PYTHON_PACKAGES} \
"

