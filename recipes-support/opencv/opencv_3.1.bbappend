PR_append = ".tisdk0"

BRANCH = "tiopencvrelease_3.1"

SRC_URI = "git://git.ti.com/opencv/tiopencv.git;protocol=git;branch=${BRANCH};name=opencv \
           git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"

SRCREV_opencv = "38dc87122e43f025f7847edcc3224cd10162f870"

PACKAGECONFIG_append_am57xx-evm= " opencl"
PACKAGECONFIG_append_dra7xx-evm= " opencl"
PACKAGECONFIG_append_keystone = " opencl"

PACKAGE_ARCH = "${MACHINE_ARCH}"

PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON -DCMAKE_CXX_FLAGS_RELEASE="${CMAKE_CXX_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DCMAKE_C_FLAGS_RELEASE="${CMAKE_C_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DWITH_OPENCLAMDFFT=OFF -DWITH_OPENCLAMDBLAS=OFF,-DWITH_OPENCL=OFF,cmem opencl,"

do_install_append() {
    install -d ${D}${datadir}/OpenCV/samples/bin/
    cp -f bin/*_test_* ${D}${datadir}/OpenCV/samples/bin/
}
