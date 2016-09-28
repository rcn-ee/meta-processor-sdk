require ti-pdk-build-rtos-1.0.0.2B.inc

do_install_append() {
    install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build

    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x

    install -m 0755 am335x/config_am335x_a8.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
    install -m 0755 am335x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
}
