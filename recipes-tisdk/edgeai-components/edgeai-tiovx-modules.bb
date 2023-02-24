SUMMARY = "EdgeAI TIOVX modules"
DESCRIPTION = "EdgeAI TIOVX modules implements simple APIs to create and use OpenVX nodes"
HOMEPAGE = "https://github.com/TexasInstruments/edgeai-tiovx-modules"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1f7721ee7d288457c5a70d0c8ff44b87"

SRC_URI = "git://git.ti.com/edgeai/edgeai-tiovx-modules.git;tag=EDGEAI_APP_STACK_08_06_00_02;nobranch=1;protocol=git"

PLAT_SOC = ""
PLAT_SOC_j7-evm = "j721e"
PLAT_SOC_j7-hs-evm = "j721e"
PLAT_SOC_j721s2-evm = "j721s2"
PLAT_SOC_j721s2-hs-evm = "j721s2"
PLAT_SOC_j784s4-evm = "j784s4"
PLAT_SOC_am62axx-evm = "am62a"

S = "${WORKDIR}/git"

DEPENDS = "ti-tisdk-firmware edgeai-tiovx-kernels"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62axx-evm"

export SOC = "${PLAT_SOC}"

EXTRA_OECMAKE = "-DTARGET_FS=${WORKDIR}/recipe-sysroot -DINSTALL_SRC=on -DCMAKE_SKIP_RPATH=TRUE"

PACKAGES += "${PN}-source"
FILES_${PN}-source += "/opt/"

inherit cmake

PR = "r0"
