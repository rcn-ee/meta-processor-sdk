PR_append = ".tisdk1"

require ti-ipc-3.47.02.00.inc

require ti-ipc-rtos-3.47.02.00.inc

ALT_PLATFORM_am57xx-evm = "AM572X AM571X"

do_compile() {

  cd ${S_ipc-examples}/src
  oe_runmake .examples \
    IPCTOOLS="${S_ipc-metadata}/src/etc"

  for alt_platform in ${ALT_PLATFORM}; do
    oe_runmake .examples "PLATFORM=${alt_platform}" \
      IPCTOOLS="${S_ipc-metadata}/src/etc"
  done
}

do_compile_append() {

  if [  "${PLATFORM}" != "UNKNOWN" ]; then
    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"

    for alt_platform in ${ALT_PLATFORM}; do
      oe_runmake extract PLATFORM="${alt_platform}" HOSTOS="bios" \
         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
    done
    oe_runmake -C examples all HOSTOS="bios" \
      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
    for alt_platform in ${ALT_PLATFORM}; do
      oe_runmake -C examples all HOSTOS="bios" \
        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${alt_platform}"
    done
  fi
}

do_install_append() {
  if [  "${PLATFORM}" != "UNKNOWN" ]; then
    # Install directory for bios examples
    install -d ${D}/ipc_${IPC_VERSION}/examples/bios
    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
    oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"

    for alt_platform in ${ALT_PLATFORM}; do
      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
        PLATFORM="${alt_platform}"
      oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
        PLATFORM="${alt_platform}"
    done
  fi
}

