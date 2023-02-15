SUMMARY = "EdgeAI Studio Agent"
DESCRIPTION = "EdgeAI Device Agent runs on TI devices to enable EdgeAI Studio tool"
HOMEPAGE = "https://github.com/TexasInstruments/edgeai-studio-agent"

LICENSE = "TI-TFL"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=3677661f72cd03c7b3c0a35e5fb23e8d"

SRC_URI = "git://github.com/TexasInstruments/edgeai-studio-agent.git;protocol=https;branch=develop"
SRCREV = "1386f9b4a9db4e05e2b0221a676ba2499af16eeb"

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

RDEPENDS_${PN} += "edgeai-gst-apps-source bash python3-core python3-aiofiles python3-websocket-client python3-idna python3-click cors express nodejs"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx-evm"

export SOC = "${PLAT_SOC}"

FILES_${PN} += "/opt"
FILES_${PN} += "${libdir}/python3.8/*"

do_install() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    mkdir -p ${D}/opt/edgeai-studio-agent
    cp ${CP_ARGS} ${WORKDIR}/git/* ${D}/opt/edgeai-studio-agent

    PY_DST_DIR="${D}${libdir}/python3.8/site-packages"
    PIP3_INSTALL_PARAMS="--platform linux_aarch64 --only-binary=:all: --target ${PY_DST_DIR} --disable-pip-version-check --no-deps"

    if [ -n "${http_proxy}" ]
    then
        PIP3_INSTALL_PARAMS="${PIP3_INSTALL_PARAMS} --proxy ${http_proxy}"
    fi

    pip3 install ${PIP3_INSTALL_PARAMS} uvicorn
    pip3 install ${PIP3_INSTALL_PARAMS} fastapi
    pip3 install ${PIP3_INSTALL_PARAMS} python-multipart
    pip3 install ${PIP3_INSTALL_PARAMS} pydantic
    pip3 install ${PIP3_INSTALL_PARAMS} typing-extensions
    pip3 install ${PIP3_INSTALL_PARAMS} starlette
    pip3 install ${PIP3_INSTALL_PARAMS} anyio
    pip3 install ${PIP3_INSTALL_PARAMS} sniffio
    pip3 install ${PIP3_INSTALL_PARAMS} h11
}

PR = "r2"
