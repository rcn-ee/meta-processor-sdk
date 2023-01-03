SUMMARY = "EdgeAI Apps"
DESCRIPTION = "EdgeAI Apps implements simple deep learning demos that runs on TI platforms"
HOMEPAGE = "https://git.ti.com/cgit/edgeai/edge_ai_apps/"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=1f7721ee7d288457c5a70d0c8ff44b87"

SRC_URI = "git://git.ti.com/edgeai/edge_ai_apps.git;protocol=git;branch=develop"
SRCREV = "47c8ad4bcd7783d7fb97a9bd35e2104fc9ea0167"

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

    mkdir -p ${D}/opt/edge_ai_apps
    cp ${CP_ARGS} ${WORKDIR}/git/* ${D}/opt/edge_ai_apps
    rm -rf ${D}/opt/edge_ai_apps/apps_cpp/lib

    mkdir -p ${D}/opt/model_zoo
    cd ${WORKDIR}/git/
    ./download_models.sh --recommended
    cd -
    cp ${CP_ARGS} -L ${WORKDIR}/model_zoo/* ${D}/opt/model_zoo
}

INSANE_SKIP_${PN}-source += "dev-deps"

PR = "r0"
