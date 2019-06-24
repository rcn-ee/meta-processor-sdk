DESCRIPTION = "Demo application based on pytorch neural network compiler glow, using mnist model" 
HOMEPAGE = "https://github.com/pytorch/glow/tree/master/examples/bundles/lenet_mnist"
SECTION = "examples" 
LICENSE = "Apache-2.0" 
LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"

PV = "1.0"
PR = "r1" 

DEPENDS    = "glow-native libpng"

SRC_URI = "https://raw.githubusercontent.com/pytorch/glow/1af031c9c040dd4ff843d9b50f83e71f6e605631/examples/bundles/lenet_mnist/main.cpp;name=lenet_mnist_main;subdir=src \
           file://0001-fix-missing-string.patch \
           file://makefile;subdir=src \
           file://Makefile.build;subdir=src \
           http://fb-glow-assets.s3.amazonaws.com/models/lenet_mnist.tar.gz;name=lenet_mnist;subdir=src \
           https://raw.githubusercontent.com/pytorch/glow/1af031c9c040dd4ff843d9b50f83e71f6e605631/LICENSE;name=lenet_mnist_license;subdir=src \
          "

SRC_URI[lenet_mnist.md5sum] = "7aded5f273b3198795683c238492d1a9"
SRC_URI[lenet_mnist_main.md5sum] = "e80ec7a97dec86828ff1a51026c237bc"
SRC_URI[lenet_mnist_license.md5sum] = "86d3f3a95c324c9479bd8986968f4327"

S = "${WORKDIR}/src"

do_compile() {
   install -d ${WORKDIR}/build
   ${STAGING_DIR_NATIVE}/usr/share/glow/bin/image-classifier ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ${WORKDIR}/build/ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
   ${CXX} ${S}/main.cpp ${WORKDIR}/build/lenet_mnist.o -lm -lpng -fpack-struct=8 -fpermissive -o ${WORKDIR}/build/infer_mnist
}

do_install () {
   install -d ${D}${datadir}/glow/infer
   install -d ${D}${datadir}/glow/tests
   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/*.weights ${D}${datadir}/glow/infer
   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/infer_mnist ${D}${datadir}/glow/infer
   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/lenet_mnist.o ${D}${datadir}/glow/infer
   cp -Prf --preserve=mode,timestamps ${WORKDIR}/src/makefile ${D}${datadir}/glow/infer
   cp -Prf --preserve=mode,timestamps ${WORKDIR}/src/main.cpp ${D}${datadir}/glow/infer
   cp -Prf --preserve=mode,timestamps ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/*.png ${D}${datadir}/glow/tests/.
}

FILES_${PN} += "${datadir}/glow"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
