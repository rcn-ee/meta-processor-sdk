DESCRIPTION = "Pytorch neural network compiler" 
HOMEPAGE = "https://github.com/pytorch/glow"

SECTION = "devel" 
LICENSE = "Apache-2.0 & MIT" 
LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
PV = "0.1+git${SRCPV}"
PR = "r0" 
SRCREV_FORMAT = "glow"

DEPENDS_class-native    = "zlib zlib-native llvm-glow-native ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"
DEPENDS_class-nativesdk = "ncurses protobuf libpng glow-native zlib llvm-glow-native ninja-native protobuf-native libpng-native protobuf-c-native gflags-native glog-native"

RDEPENDS_${PN}_class-nativesdk = "libpng ncurses glog"

SRC_URI = "git://github.com/pytorch/glow.git;protocol=https;destsuffix=git;name=glow \
           file://0001-Fix-path-and-dependencies-to-intermediate-executable.patch  \
           git://github.com/stp/OutputCheck.git;protocol=https;destsuffix=git/tests/OutputCheck;name=outcheck \
           git://github.com/google/benchmark.git;protocol=https;destsuffix=git/tests/googlebenchmark;name=gbench \
           git://github.com/google/googletest.git;protocol=https;destsuffix=git/tests/googletest;name=gtest \
           git://github.com/houseroad/foxi.git;protocol=https;destsuffix=git/thirdparty/foxi;name=foxi \
           git://github.com/Maratyszcza/FP16.git;protocol=https;destsuffix=git/thirdparty/fp16;name=fp16 \
           git://github.com/onnx/onnx.git;protocol=https;destsuffix=git/thirdparty/onnx;name=onnx \
           git://github.com/google/benchmark.git;protocol=https;destsuffix=git/thirdparty/onnx/third_party/benchmark;name=onnxbench \
           git://github.com/pybind/pybind11.git;protocol=https;destsuffix=git/thirdparty/onnx/third_party/pybind11;name=onnxpybind11 \
           git://github.com/wjakob/clang-cindex-python3.git;protocol=https;destsuffix=git/thirdparty/onnx/third_party/pybind11/tools/clang;name=onnxclang \
          "

SRCREV_glow = "ba8061367aea0b472b596448018107ca6e87929e"
SRCREV_outcheck = "eab62a5dd5129f6a4ebfbe4bbe41d35611f7c48d"
SRCREV_gbench = "090faecb454fbd6e6e17a75ef8146acb037118d4"
SRCREV_gtest = "0c799d0436e1b6d867c1738f6ff58166d153cacc"
SRCREV_foxi = "b2ec1a8041879b7be98d81387a14cae895f952f4"
SRCREV_fp16 = "34d4bf01bbf7376f2baa71b8fa148b18524d45cf"
SRCREV_onnx = "50dc186b50ea512d6888aa1f47414150fd782fa0"
SRCREV_onnxbench = "e776aa0275e293707b6a0901e0e8d8a8a3679508"
SRCREV_onnxpybind11 = "a1041190c8b8ff0cd9e2f0752248ad5e3789ea0c"
SRCREV_onnxclang = "6a00cbc4a9b8e68b71caf7f774b3f9c753ae84d5"

S = "${WORKDIR}/git"

inherit pkgconfig cmake

EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-dynamic-linker=/lib64/ld-linux-x86-64.so.2 " "

do_compile() {
   cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
}

do_install () {
   install -d ${D}${datadir}/glow
   install -d ${D}${datadir}/glow/tests/images
   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin ${D}${datadir}/glow
   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/EmotionSampleImages ${D}${datadir}/glow/tests/images
   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet ${D}${datadir}/glow/tests/images
   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet_299 ${D}${datadir}/glow/tests/images
   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/mnist ${D}${datadir}/glow/tests/images
   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/other ${D}${datadir}/glow/tests/images
}

BBCLASSEXTEND = "native nativesdk"

FILES_${PN} = "${datadir}"
