SUMMARY = "DLPack headers"
DESCRIPTION = "DLPack: Open In Memory Tensor Structure"
HOMEPAGE = "https://github.com/dmlc/dlpack/tree/master"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab"

SRC_URI = "git://github.com/dmlc/dlpack.git;protocol=https;branch=master"
SRCREV = "3ec04430e89a6834e5a1b99471f415fa939bf642"

S = "${WORKDIR}/git"

PACKAGES = "${PN}-src ${PN}-dbg ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN} ${PN}-staticdev ${PN}-dev"

FILES_${PN} += "${includedir}/dlpack"

do_install() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    mkdir -p ${D}${includedir}/dlpack
    cp ${CP_ARGS} ${S}/include/dlpack/* ${D}${includedir}/dlpack
}

PR = "r0"
