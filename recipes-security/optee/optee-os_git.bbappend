PR_append = ".tisdk0"

do_compile_am65xx-hs-evm() {
    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager.bin tee-pager.bin.signed; \
        normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
        mv tee.bin.signed ${B}/$normfl.optee; \
        mv tee-pager.bin.signed ${B}/bl32.bin; \
        cp tee.elf ${B}/bl32.elf; \
    )
}
