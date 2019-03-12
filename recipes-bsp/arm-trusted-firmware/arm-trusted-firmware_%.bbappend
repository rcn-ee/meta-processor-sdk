PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://0001-HACK-firmware-ti_sci-remove-EXCLUSIVE-flag.patch"

DEPENDS_append = " openssl-native"

# Sign ATF here
do_compile_am65xx-hs-evm() {
    oe_runmake all

    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
    ( cd ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/; \
        mv bl31.bin bl31.bin.unsigned; \
        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
    )
}
