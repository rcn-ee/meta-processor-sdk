PR_append = ".tisdk6"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bbbd5cbb55e4c54d3b02456ae553bea86fd61506','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"

do_install_append () {
    ln -sf ./libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
}
