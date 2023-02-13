SUMMARY = "EdgeAI Gst Apps"
DESCRIPTION = "EdgeAI Gst Apps implements gstreamer based simple deep learning demos that runs on TI platforms"
HOMEPAGE = "https://github.com/TexasInstruments/edgeai-gst-apps"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=dc68ab0305d85e56491b9a9aed2309f2"

SRC_URI = "git://github.com/TexasInstruments/edgeai-gst-apps.git;protocol=https;branch=develop"
SRCREV = "cc9d2c336aa84777dcde5c2d2cbea6bb4466d67b"

PLAT_SOC = ""
PLAT_SOC_j7-evm = "j721e"
PLAT_SOC_j7-hs-evm = "j721e"
PLAT_SOC_j721s2-evm = "j721s2"
PLAT_SOC_j721s2-hs-evm = "j721s2"
PLAT_SOC_j784s4-evm = "j784s4"
PLAT_SOC_am62axx-evm = "am62a"

S = "${WORKDIR}/git/apps_cpp"

DEPENDS = "ti-tisdk-firmware edgeai-dl-inferer yaml-cpp gstreamer1.0 opencv"

RDEPENDS_${PN} += "edgeai-gst-plugins edgeai-dl-inferer-staticdev"

RDEPENDS_${PN}-source += "bash python3-core edgeai-dl-inferer-dev"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62axx-evm"

export SOC = "${PLAT_SOC}"

EXTRA_OECMAKE = "-DTARGET_FS=${WORKDIR}/recipe-sysroot -DCMAKE_SKIP_RPATH=TRUE"

PACKAGES += "${PN}-source"
FILES_${PN}-source += "/opt"

inherit cmake

do_install() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    mkdir -p ${D}/opt/edgeai-gst-apps
    cp ${CP_ARGS} ${WORKDIR}/git/* ${D}/opt/edgeai-gst-apps
    rm -rf ${D}/opt/edgeai-gst-apps/apps_cpp/lib

    mkdir -p ${D}/opt/model_zoo
    mkdir -p ${D}/opt/edgeai-test-data
    export EDGEAI_DATA_PATH=${WORKDIR}/edgeai-test-data

    cd ${WORKDIR}/git/
    ./download_models.sh --recommended
    ./download_test_data.sh
    cd -
    cp ${CP_ARGS} -L ${WORKDIR}/model_zoo/* ${D}/opt/model_zoo
    cp ${CP_ARGS} -L ${WORKDIR}/edgeai-test-data/* ${D}/opt/edgeai-test-data
}

INSANE_SKIP_${PN}-source += "dev-deps"

PR = "r3"
