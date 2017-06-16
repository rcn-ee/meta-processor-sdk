PR_append = ".tisdk5"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','cf8cd620e96c9741bfcbe7f07c95328fe2d6ece9','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"

do_install_append () {
    ln -sf ./libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.2
}
