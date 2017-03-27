PV = "01.00.00.04B"
PR = "r1"

# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.04B"
PDK_BUILD_SRCREV = "98b62506c451304252c7cd1e6af60dd11adc588a"

do_install() {
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    
    install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
    install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build

    install -m 0755 makerules/build_config.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    install -m 0755 makerules/common.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    install -m 0755 makerules/component.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    install -m 0755 makerules/env.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    install -m 0755 makerules/platform.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
}

do_install_append_ti33x() {
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss

    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules

    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
}

do_install_append_ti43x() {
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss

    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    
    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
}

do_install_append_am57xx-evm() {
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss

    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    
    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
}
 
do_install_append_dra7xx-evm() {
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx

    install -m 0755 makefile ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/

    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    install -m 0755 makerules/rules_arp32.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules

    install -m 0755 tda2xx/config_tda2xx.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
    install -m 0755 tda2xx/config_tda2xx_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
    install -m 0755 tda2xx/config_tda2xx_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
    install -m 0755 tda2xx/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
    install -m 0755 tda3xx/config_tda3xx.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
    install -m 0755 tda3xx/config_tda3xx_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
}

do_install_append_k2g-evm() {
    install -m 0755 k2g/config_k2g_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
}
