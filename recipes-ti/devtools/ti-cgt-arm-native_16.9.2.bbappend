PR_append = ".tisdk0"

do_configure_append() {
    rm -f ./ti-cgt-arm_${PV}.LTS/lib/rtsv7R4_A_le_v3D16_eabi.lib
}
