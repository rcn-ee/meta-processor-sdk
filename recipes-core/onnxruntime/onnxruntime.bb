DESCRIPTION = "ONNX Runtime is an open-source scoring engine for Open Neural \
Network Exchange (ONNX) models. ONNX Runtime has an open architecture that \
is continually evolving to address the newest developments and challenges \
in AI and Deep Learning."
SUMMARY = "ONNX Runtime"
HOMEPAGE = "https://github.com/microsoft/onnxruntime"
LICENSE = "MIT"

S = "${WORKDIR}/git"
PV = "1.7.0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LIC_FILES_CHKSUM = "file://LICENSE;md5=0f7e3b1308cb5c00b372a6e78835732d \
"

SRC_URI = "git://github.com/TexasInstruments/onnxruntime;protocol=https;branch=tidl-j7;name=base \
"

SRCREV_base = "a2c52112dbd22e014bcf795b09e172aaa21afcea"

inherit setuptools3 cmake python3native
do_configure[network] = "1"
export GIT_CONFIG_PARAMETERS="'safe.directory=*'"

DEPENDS += " \
    zlib \
    python3-numpy-native \
    python3-pybind11-native \
    protobuf-native \
    python3-wheel-native \
"

OECMAKE_SOURCEPATH = "${S}/cmake"

DISTUTILS_SETUP_PATH = "${B}"

EXTRA_OECMAKE = " \
    -DONNX_CUSTOM_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
    -Donnxruntime_RUN_ONNX_TESTS=OFF \
    -Donnxruntime_BUILD_WINML_TESTS=ON \
    -Donnxruntime_GENERATE_TEST_REPORTS=ON \
    -Donnxruntime_DEV_MODE=ON \
    -DPYTHON_EXECUTABLE=${PYTHON} \
    -Donnxruntime_USE_CUDA=OFF \
    -Donnxruntime_CUDA_VERSION= \
    -Donnxruntime_CUDA_HOME= \
    -Donnxruntime_CUDNN_HOME= \
    -Donnxruntime_USE_FEATURIZERS=OFF \
    -Donnxruntime_USE_MIMALLOC_STL_ALLOCATOR=OFF \
    -Donnxruntime_USE_MIMALLOC_ARENA_ALLOCATOR=OFF \
    -Donnxruntime_ENABLE_PYTHON=ON \
    -Donnxruntime_BUILD_CSHARP=OFF \
    -Donnxruntime_BUILD_JAVA=OFF \
    -Donnxruntime_BUILD_NODEJS=OFF \
    -Donnxruntime_BUILD_SHARED_LIB=ON \
    -Donnxruntime_USE_DNNL=OFF \
    -Donnxruntime_DNNL_GPU_RUNTIME= \
    -Donnxruntime_DNNL_OPENCL_ROOT= \
    -Donnxruntime_USE_NNAPI_BUILTIN=OFF \
    -Donnxruntime_USE_RKNPU=OFF \
    -Donnxruntime_USE_OPENMP=OFF \
    -Donnxruntime_USE_TVM=OFF \
    -Donnxruntime_USE_LLVM=OFF \
    -Donnxruntime_ENABLE_MICROSOFT_INTERNAL=OFF \
    -Donnxruntime_USE_VITISAI=OFF \
    -Donnxruntime_USE_NUPHAR=OFF \
    -Donnxruntime_USE_TENSORRT=OFF \
    -Donnxruntime_TENSORRT_HOME= \
    -Donnxruntime_USE_MIGRAPHX=OFF \
    -Donnxruntime_MIGRAPHX_HOME= \
    -Donnxruntime_CROSS_COMPILING=OFF \
    -Donnxruntime_DISABLE_CONTRIB_OPS=OFF \
    -Donnxruntime_DISABLE_ML_OPS=OFF \
    -Donnxruntime_DISABLE_RTTI=OFF \
    -Donnxruntime_DISABLE_EXCEPTIONS=OFF \
    -Donnxruntime_DISABLE_ORT_FORMAT_LOAD=OFF \
    -Donnxruntime_MINIMAL_BUILD=OFF \
    -Donnxruntime_EXTENDED_MINIMAL_BUILD=OFF \
    -Donnxruntime_MINIMAL_BUILD_CUSTOM_OPS=OFF \
    -Donnxruntime_REDUCED_OPS_BUILD=OFF \
    -Donnxruntime_MSVC_STATIC_RUNTIME=OFF \
    -Donnxruntime_ENABLE_LANGUAGE_INTEROP_OPS=OFF \
    -Donnxruntime_USE_DML=OFF \
    -Donnxruntime_USE_WINML=OFF \
    -Donnxruntime_BUILD_MS_EXPERIMENTAL_OPS=OFF \
    -Donnxruntime_USE_TELEMETRY=OFF \
    -Donnxruntime_ENABLE_LTO=OFF \
    -Donnxruntime_USE_ACL=OFF \
    -Donnxruntime_USE_ACL_1902=OFF \
    -Donnxruntime_USE_ACL_1905=OFF \
    -Donnxruntime_USE_ACL_1908=OFF \
    -Donnxruntime_USE_ACL_2002=OFF \
    -Donnxruntime_USE_ARMNN=OFF \
    -Donnxruntime_ARMNN_RELU_USE_CPU=ON \
    -Donnxruntime_ARMNN_BN_USE_CPU=ON \
    -Donnxruntime_ENABLE_NVTX_PROFILE=OFF \
    -Donnxruntime_ENABLE_TRAINING=OFF \
    -Donnxruntime_ENABLE_TRAINING_OPS=OFF \
    -Donnxruntime_ENABLE_CPU_FP16_OPS=OFF \
    -Donnxruntime_USE_NCCL=ON \
    -Donnxruntime_BUILD_BENCHMARKS=OFF \
    -Donnxruntime_USE_ROCM=OFF \
    -Donnxruntime_ROCM_HOME= \
    -DOnnxruntime_GCOV_COVERAGE=OFF \
    -Donnxruntime_USE_MPI=ON \
    -Donnxruntime_ENABLE_MEMORY_PROFILE=OFF \
    -Donnxruntime_ENABLE_CUDA_LINE_NUMBER_INFO=OFF \
    -Donnxruntime_PYBIND_EXPORT_OPSCHEMA=OFF \
    -Donnxruntime_ENABLE_MEMLEAK_CHECKER=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -Donnxruntime_USE_TIDL=ON \
"
do_configure_prepend() {
    cd ${WORKDIR}/git
   git submodule init
    git submodule update --init --recursive
}

do_install() {
    cmake_do_install

    install -d ${B}/docs/python

    install -m 0644 ${S}/setup.py ${B}
    install -m 0644 ${S}/requirements.txt ${B}
    install -m 0644 ${S}/docs/python/README.rst ${B}/docs/python

    distutils3_do_install --use_tidl
}

PR_append = ".tisdk0"
