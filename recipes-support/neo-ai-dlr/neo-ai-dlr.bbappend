PR_append = ".int0"

LICENSE = "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib & MIT & Unlicense"

LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
                    file://3rdparty/tvm/LICENSE;md5=f563935cf80d1c889dd958372e9ea7c4 \
                    file://3rdparty/tvm/3rdparty/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
                    file://3rdparty/tvm/3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
                    file://3rdparty/tvm/3rdparty/rang/LICENSE;md5=911690f51af322440237a253d695d19f \
                    file://3rdparty/treelite/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
                    file://3rdparty/treelite/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
                    file://3rdparty/treelite/3rdparty/fmt/LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b \
                    file://3rdparty/treelite/3rdparty/protobuf/LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
                    file://3rdparty/treelite/3rdparty/protobuf/third_party/benchmark/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                    file://3rdparty/treelite/3rdparty/protobuf/third_party/googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
"

SRC_DISTRIBUTE_LICENSES += "Unlicense"

PV = "1.01"

DEPENDS += " opencv "

BRANCH-NEO-AI-DLR = "dev"
BRANCH-NEO-TVM = "dev"

# Main DLR sources plus submodules (and submodules of submodules).
SRC_URI = "git://github.com/TexasInstruments/neo-ai-dlr;protocol=https;branch=${BRANCH-NEO-AI-DLR};name=neo-ai-dlr \
           git://github.com/TexasInstruments/tvm;protocol=https;branch=${BRANCH-NEO-TVM};destsuffix=${S}/3rdparty/tvm;name=neo-ai-tvm \
           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=neo-ai-tvm-dmlc-core \
           git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=neo-ai-tvm-dlpack \
           git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/rang;name=neo-ai-tvm-rang \
           git://github.com/neo-ai/treelite;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite;name=neo-ai-treelite \
           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite/dmlc-core;name=neo-ai-treelite-dmlc-core \
           git://github.com/fmtlib/fmt;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/fmt;name=neo-ai-treelite-fmt \
           git://github.com/google/protobuf;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf;name=neo-ai-treelite-protobuf \
           git://github.com/google/benchmark;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/benchmark;name=neo-ai-treelite-protobuf-benchmark \
           git://github.com/google/googletest;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/googletest;name=neo-ai-treelite-protobuf-googletest \
"

SRCREV_neo-ai-dlr = "40394be2e39eaa6248f9bf0a1143692083c0e3d2"
SRCREV_neo-ai-tvm = "11f0a9d2349b94a733aae1c8bd652e6055f4b185"
SRCREV_neo-ai-tvm-dmlc-core = "ca9f9329654dbd42f06988276c6f74eb8bdd5038"
SRCREV_neo-ai-tvm-dlpack = "b7bd45cdd8b67f4ab2502a8717f2e0926d9b4121"
SRCREV_neo-ai-tvm-rang = "cabe04d6d6b05356fa8f9741704924788f0dd762"

SRCREV_neo-ai-treelite = "938af7867641fb09a8c93aadb66587ad9cbed9c2"
SRCREV_neo-ai-treelite-dmlc-core = "ec147925f1daccee6a33796880935f9cec8541cf"
SRCREV_neo-ai-treelite-fmt = "9f2e7edaebccf8f271cec5e855cce1223ff3e6d6"
SRCREV_neo-ai-treelite-protobuf = "6d087c256c8ab04b3a1a9832746e9c3a8d3afd79"
SRCREV_neo-ai-treelite-protobuf-benchmark = "360e66c1c4777c99402cf8cd535aa510fee16573"
SRCREV_neo-ai-treelite-protobuf-googletest = "78fdd6c00b8fa5dd67066fbb796affc87ba0e075"

do_compile_append() {
   ninja demo
   ninja democv
}


do_install_append() {

    # Now install additional python test scripts, bash scripts and precomputed models
    install -d ${D}${datadir}/dlr/demos
    cp -Prf --preserve=mode,timestamps ${S}/examples/tidl/* ${D}${datadir}/dlr/demos
    install -m 0755 ${B}/bin/* ${D}${datadir}/dlr/demos/.
}

FILES_${PN}-tests += "${datadir}/dlr/demos"
