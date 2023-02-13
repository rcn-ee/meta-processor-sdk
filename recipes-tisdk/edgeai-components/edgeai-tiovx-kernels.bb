SUMMARY = "EdgeAI TIOVX kernels"
DESCRIPTION = "EdgeAI TIOVX kernels implements ARMv8 neon optimized OpenVX target kernels"
HOMEPAGE = "https://git.ti.com/cgit/edgeai/edgeai-tiovx-kernels"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1f7721ee7d288457c5a70d0c8ff44b87"

SRC_URI = "git://git.ti.com/edgeai/edgeai-tiovx-kernels.git;tag=EDGEAI_APP_STACK_08_06_00_00;nobranch=1;protocol=git"

PLAT_SOC = ""
PLAT_SOC_j7-evm = "j721e"
PLAT_SOC_j7-hs-evm = "j721e"
PLAT_SOC_j721s2-evm = "j721s2"
PLAT_SOC_j721s2-hs-evm = "j721s2"
PLAT_SOC_j784s4-evm = "j784s4"
PLAT_SOC_am62axx-evm = "am62a"

S = "${WORKDIR}/git"

DEPENDS = "ti-tisdk-firmware"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62axx-evm"

export SOC = "${PLAT_SOC}"

EXTRA_OECMAKE = "-DTARGET_FS=${WORKDIR}/recipe-sysroot -DCMAKE_SKIP_RPATH=TRUE"

PACKAGES += "${PN}-source"
FILES_${PN}-source += "/opt/"

inherit cmake

do_install_append() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    mkdir -p ${D}/opt/edgeai-tiovx-kernels
    cp ${CP_ARGS} ${S}/* ${D}/opt/edgeai-tiovx-kernels
    cd ${D}/opt/edgeai-tiovx-kernels
    rm -rf build bin lib
}

PR = "r1"
