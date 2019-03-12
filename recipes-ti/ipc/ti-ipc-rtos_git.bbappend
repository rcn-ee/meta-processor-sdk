require ti-ipc-common-next.inc
require ti-ipc-rtos-next.inc

DEPENDS_append_am65xx-hs-evm = " sciclient-rtos"

do_install_prepend_am65xx-hs-evm () {
  # Trim directory name
  mv ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_false_R5F0 ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_R5F0
  mv ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_false_R5F1 ${S}/packages/ti/ipc/tests/bin/ti_platforms_cortexR_AM65X_R5F1
}

pkg_postinst_${PN}-fw_am65xx-hs-evm () {
  update-alternatives --install /lib/firmware/am65x-mcu-r5f0-fw am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
  update-alternatives --install /lib/firmware/am65x-mcu-r5f1-fw am65x-mcu-r5f1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
}

pkg_postrm_${PN}-fw_am65xx-hs-evm () {
  update-alternatives --remove am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f
  update-alternatives --remove am65x-mcu-r5f1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f
}
