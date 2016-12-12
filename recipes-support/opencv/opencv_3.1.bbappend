PR_append = ".tisdk7"

BRANCH = "tiopencvrelease_3.1"

SRC_URI = "git://git.ti.com/opencv/tiopencv.git;protocol=git;branch=${BRANCH};name=opencv \
           git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
           git://github.com/Itseez/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
           file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
           file://fixpkgconfig.patch"

SRCREV_opencv = "b4f54ac48ced0ade8223eafab9cd3ad6dbb1b515"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
     file://setupEnv.sh \
"

DEPENDS_remove_keystone = "qtbase"

PACKAGECONFIG_append_am57xx-evm= " opencl"
PACKAGECONFIG_append_dra7xx-evm= " opencl"
PACKAGECONFIG_append_keystone = " opencl"

PACKAGE_ARCH = "${MACHINE_ARCH}"

PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON -DCMAKE_CXX_FLAGS_RELEASE="${CMAKE_CXX_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DCMAKE_C_FLAGS_RELEASE="${CMAKE_C_FLAGS_RELEASE} -DCV_TIOPENCL -DCV_TIOPENCL_ENABLE_PROGRAM_COUNT -DMAX_PROGRAM_HASH_SIZE=50" -DWITH_OPENCLAMDFFT=OFF -DWITH_OPENCLAMDBLAS=OFF,-DWITH_OPENCL=OFF,cmem opencl,"

do_install_append() {
    install -d ${D}${datadir}/OpenCV/samples/bin/
    install -d ${D}${datadir}/OpenCV/titestsuite/
    cp -f bin/*_test_* ${D}${datadir}/OpenCV/samples/bin/
    cp -f ${S}/titestsuite/* ${D}${datadir}/OpenCV/titestsuite/
    cp -f ${WORKDIR}/setupEnv.sh ${D}${datadir}/OpenCV/titestsuite/
}

ALLOW_EMPTY_${PN}-locale = "1"
