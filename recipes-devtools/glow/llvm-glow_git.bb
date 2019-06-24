DESCRIPTION = "LLVM release suggested for pytorch glow neural network compiler"
HOMEPAGE = "https://github.com/llvm-mirror/llvm"
SECTION = "devel"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
PV = "8.0"
PR = "r0"

DEPENDS = "ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"

SOLIBVER = "1"

SRC_URI = "git://github.com/llvm-mirror/llvm.git;protocol=https;branch=release_80;rev=5563a6a769b48912b9c8052124520610966eda28;destsuffix=git/llvm \
           git://github.com/llvm-mirror/clang.git;protocol=https;branch=release_80;rev=ccfe04576c13497b9c422ceef0b6efe99077a392;destsuffix=git/clang \
           "


S = "${WORKDIR}/git/llvm"

EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DLLVM_INSTALL_UTILS=ON -DLLVM_ENABLE_PROJECTS=clang"

inherit pkgconfig cmake

BBCLASSEXTEND = "native nativesdk"
