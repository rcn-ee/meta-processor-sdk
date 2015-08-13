require recipes-ti/includes/ti-paths-append.inc

SRC_URI = "git://gitorious.design.ti.com/+edma3-lld-developers/edma3/edma3_lld_development.git;protocol=git;branch=${BRANCH}"
SRCREV = "4eb7cc5fcb7589a95248399e337d26fd5c4382eb"

PV = "2.12.01.22"

PR = "r2"
PR_append = ".ti-int0"

DEPENDS_append = " ti-ccsv6-native"

COMPATIBLE_MACHINE_append = "|ti33x|ti43x|omap-a15"

PLATFORMLIST_ti33x = " \
        am335x-evm \
"

TARGETLIST_ti33x = " \
        a8 \
"

PLATFORMLIST_ti43x = " \
        am437x-evm \
"

TARGETLIST_ti43x = " \
        arm9 \
"

PLATFORMLIST_dra7xx = " \
        tda2xx-evm \
"

TARGETLIST_dra7xx = " \
        66 \
        a15 \
        m4 \
"

EXTRA_OEMAKE_remove = "TARGET=66"

do_configure_prepend () {
    sed -i -e "s|_config.bld|config.bld|g" ${S}/makerules/env.mk
    sed -i -e "s|^edma3_lld_PATH =.*$|edma3_lld_PATH = ${S}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_M3 =.*$|CODEGEN_PATH_M3 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_M4 =.*$|CODEGEN_PATH_M4 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A8 =.*$|CODEGEN_PATH_A8 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A8_GCC =.*$|CODEGEN_PATH_A8_GCC = ${A15_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_ARM9 =.*$|CODEGEN_PATH_ARM9 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A9_GCC =.*$|CODEGEN_PATH_A9_GCC = ${A15_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A15 =.*$|CODEGEN_PATH_A15 = ${A15_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A15_GCC =.*$|CODEGEN_PATH_A15_GCC = ${A15_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
}

do_compile() {
    for p in ${PLATFORMLIST}
    do
        for t in ${TARGETLIST}
        do
            oe_runmake PLATFORM=${p} TARGET=${t}
        done
    done
    sourceipk_do_create_srcipk
}

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "edma3_lld_02_12_01_22"
