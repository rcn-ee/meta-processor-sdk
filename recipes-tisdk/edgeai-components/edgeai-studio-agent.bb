SUMMARY = "EdgeAI Studio Agent"
DESCRIPTION = "EdgeAI Device Agent runs on TI devices to enable EdgeAI Studio tool"
HOMEPAGE = "https://github.com/TexasInstruments/edgeai-studio-agent"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=3677661f72cd03c7b3c0a35e5fb23e8d"

SRC_URI = "git://github.com/TexasInstruments/edgeai-studio-agent.git;tag=EDGEAI_APP_STACK_08_06_00_02;nobranch=1;protocol=https"

PLAT_SOC = ""
PLAT_SOC_j7-evm = "j721e"
PLAT_SOC_j7-hs-evm = "j721e"
PLAT_SOC_j721s2-evm = "j721s2"
PLAT_SOC_j721s2-hs-evm = "j721s2"
PLAT_SOC_j784s4-evm = "j784s4"
PLAT_SOC_j784s4-hs-evm = "j784s4"
PLAT_SOC_am62axx-evm = "am62a"

S = "${WORKDIR}/git"

DEPENDS += "python3-pip-native"

RDEPENDS_${PN} += "edgeai-gst-apps-source bash python3-core python3-aiofiles python3-websocket-client python3-uvicorn python3-fastapi python3-python-multipart python3-websockets cors express nodejs"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx-evm"

export SOC = "${PLAT_SOC}"

FILES_${PN} += "/opt"

do_install() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    mkdir -p ${D}/opt/edgeai-studio-agent
    cp ${CP_ARGS} ${WORKDIR}/git/* ${D}/opt/edgeai-studio-agent
}

PR = "r3"
