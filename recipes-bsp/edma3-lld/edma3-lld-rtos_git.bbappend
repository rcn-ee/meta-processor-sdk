require edma3-lld-2.12.01.22.inc

PR_append = ".tisdk0"

DEPENDS = "ti-sysbios ti-xdctools"

DEPENDS_append_keystone = " gcc-arm-none-eabi-native ti-cgt6x-native"
DEPENDS_append_ti33x = " gcc-arm-none-eabi-native"
DEPENDS_append_ti43x = " gcc-arm-none-eabi-native"
DEPENDS_append_dra7xx = " gcc-arm-none-eabi-native ti-ccsv6-native ti-cgt6x-native"

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
TARGETLIST_keystone = " \
        66 \
        a15 \
"

FORMAT="ELF"

do_configure_prepend () {
    sed -i -e "s|_config.bld|config.bld|g" ${S}/makerules/env.mk
    sed -i -e "s|^edma3_lld_PATH =.*$|edma3_lld_PATH = ${S}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_M3 =.*$|CODEGEN_PATH_M3 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_M4 =.*$|CODEGEN_PATH_M4 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A8 =.*$|CODEGEN_PATH_A8 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A8_GCC =.*$|CODEGEN_PATH_A8_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_ARM9 =.*$|CODEGEN_PATH_ARM9 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A9_GCC =.*$|CODEGEN_PATH_A9_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A15 =.*$|CODEGEN_PATH_A15 = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
    sed -i -e "s|^CODEGEN_PATH_A15_GCC =.*$|CODEGEN_PATH_A15_GCC = ${GCC_ARM_NONE_TOOLCHAIN}|g" ${S}/makerules/env.mk
}

do_compile() {
    cd ${S}/packages
    for p in ${PLATFORMLIST}
    do
        for t in ${TARGETLIST}
        do
            make PLATFORM=${p} TARGET=${t} FORMAT=${FORMAT}
        done
    done
    sourceipk_do_create_srcipk
}

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "edma3_lld_02_12_01_22"

INSANE_SKIP_${PN}-dev += "ldflags"
