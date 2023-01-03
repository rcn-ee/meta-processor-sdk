DESCRIPTION = "Processor-SDK Deep Learning packagegroup"
PR = "r2"

PACKAGE_ARCH = "${MACHINE_ARCH}"
inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = "packagegroup-dl"

DL_PACKAGES_am62axx-evm = " \
    opencv \
    opencv-dev \
    tensorflow-lite \
"

DL_PACKAGES_am62xx-evm = " \
    opencv \
    opencv-dev \
    tensorflow-lite \
    neo-ai-dlr \
    onnxruntime \
    onnxruntime-dev \
    tensorflow-lite \
"

PYTHON_PACKAGES_am62axx-evm = " \
    python3-pip \
    python3-pillow \
    python3-pyyaml \
    python3-numpy \
"

PYTHON_PACKAGES_am62xx-evm = " \
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

