require ti-pdk-build-rtos-1.0.0.2.inc

do_install_append() {
    install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
}
