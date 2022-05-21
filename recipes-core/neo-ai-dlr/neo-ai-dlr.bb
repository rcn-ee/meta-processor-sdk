SUMMARY = "NEO-AI Deep Learning Runtime"
DESCRIPTION = "Neo-AI-DLR is a common runtime for machine learning models compiled by AWS SageMaker Neo, TVM, or TreeLite."
HOMEPAGE = "https://aws.amazon.com/sagemaker/neo/"
LICENSE = "Apache-2.0 & BSD-3-Clause"

LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
                    file://3rdparty/tvm/LICENSE;md5=e313a9b6eda820e35716d9529001537f \
                    file://3rdparty/tvm/3rdparty/vta-hw/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
                    file://3rdparty/tvm/3rdparty/dmlc-core/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
                    file://3rdparty/tvm/3rdparty/rang/LICENSE;md5=911690f51af322440237a253d695d19f \
                    file://3rdparty/tvm/3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
                    file://3rdparty/tvm/3rdparty/libbacktrace/LICENSE;md5=24b5b3feec63c4be0975e1fea5100440 \
                    file://3rdparty/dlfcn-win32/COPYING;md5=64b8b80fb4b723a1a37aaae9a3f17df9 \
                    file://3rdparty/treelite/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
"

# Main DLR sources plus submodules (and submodules of submodules).
SRC_URI = "git://github.com/texasinstruments/neo-ai-dlr;protocol=https;branch=tidl-j7;name=base \
           git://github.com/texasinstruments/tvm;protocol=https;branch=tidl-j7;destsuffix=${S}/3rdparty/tvm;name=3rdparty-tvm \
           git://github.com/apache/incubator-tvm-vta;protocol=https;branch=main;destsuffix=${S}/3rdparty/tvm/3rdparty/vta-hw;name=3rdparty-tvm-3rdparty-vta-hw \
           git://github.com/dmlc/dmlc-core;protocol=https;branch=main;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=3rdparty-tvm-3rdparty-dmlc-core \
           git://github.com/ymwangg/mlas.git;protocol=https;branch=main;destsuffix=${S}/3rdparty/tvm/3rdparty/mlas;name=3rdparty-tvm-3rdparty-mlas \
           git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/rang;name=3rdparty-tvm-3rdparty-rang \
           git://github.com/dmlc/dlpack;protocol=https;branch=main;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=3rdparty-tvm-3rdparty-dlpack \
           git://github.com/tlc-pack/libbacktrace.git;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/libbacktrace;name=3rdparty-tvm-3rdparty-libbacktrace \
           git://github.com/dlfcn-win32/dlfcn-win32;protocol=https;branch=master;destsuffix=${S}/3rdparty/dlfcn-win32;name=3rdparty-dlfcn-win32 \
           git://github.com/dmlc/treelite;protocol=https;branch=mainline;destsuffix=${S}/3rdparty/treelite;name=3rdparty-treelite \
           git://github.com/llohse/libnpy;protocol=https;branch=master;destsuffix=${S}/3rdparty/libnpy;name=3rdparty-libnpy \
           file://inc \
"

SRCREV_base = "ae40254adb562eb553ea2b4976c8d20807b12fe7"
SRCREV_3rdparty-tvm = "69524ba1747de9dbee777814250b8bfa15186cc6"
SRCREV_3rdparty-tvm-3rdparty-vta-hw = "dfe9f572a43d41e0c1ecdf036cea97042a0febfe"
SRCREV_3rdparty-tvm-3rdparty-dmlc-core = "21cc7de0dc9fd6acb796e1be6181fa8e6b6c8f41"
SRCREV_3rdparty-tvm-3rdparty-mlas = "2fa74e6193350f5fa146fa100a6f7eb162ed69a1"
SRCREV_3rdparty-tvm-3rdparty-rang = "cabe04d6d6b05356fa8f9741704924788f0dd762"
SRCREV_3rdparty-tvm-3rdparty-dlpack = "ddeb264880a1fa7e7be238ab3901a810324fbe5f"
SRCREV_3rdparty-tvm-3rdparty-libbacktrace = "08f7c7e69f8ea61a0c4151359bc8023be8e9217b"
SRCREV_3rdparty-dlfcn-win32 = "008df693cf5a71b8f1db87731a7b5af87400e5dd"
SRCREV_3rdparty-treelite = "fdf09b790ae806dcc834ea242b90d20e9e3f32a5"
SRCREV_3rdparty-libnpy = "641f2a581357a51c0973889f031ad88db28de31a"

S = "${WORKDIR}/git"

inherit setuptools3 cmake python3native

# Set B so that DLR Python installation can find the library
B = "${S}/build"

EXTRA_OECMAKE = "-DDLR_BUILD_TESTS=OFF "

PACKAGES =+ "${PN}-tests"
FILES_${PN}-tests = "${datadir}/dlr/tests"
RDEPENDS_${PN}-tests += "${PN}"

# Versioned libs are not produced
FILES_SOLIBSDEV = ""

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# once file://inc is resolved, fix USE_TIDL_RT_PATH
EXTRA_OECMAKE += "-DUSE_TIDL=ON -DUSE_TIDL_RT_PATH=${S}/.. "

DISTUTILS_SETUP_PATH = "${S}/python"

do_install() {
    # This does not do anything
    #cmake_do_install

    install -d ${D}${includedir}/dlr_hexagon
    install -m 0644 ${S}/include/*.h ${D}${includedir}
    install -m 0644 ${S}/include/dlr_hexagon/*.h ${D}${includedir}/dlr_hexagon

    # Install DLR Python binding
    distutils3_do_install

    # setup.py install some libs under datadir, but we don't need them, so remove.
    rm ${D}${datadir}/dlr/*.so

    # Install DLR library to Python import search path
    install -m 0644 ${S}/build/lib/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
}

PV = "1.10.0"
PR_append = ".tisdk0"
