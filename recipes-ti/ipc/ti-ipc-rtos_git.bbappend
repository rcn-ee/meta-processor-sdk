PR_append = ".tisdk1"

require ti-ipc-3.47.02.00.inc

require ti-ipc-rtos-3.47.02.00.inc

ALT_PLATFORM_am57xx-evm = "AM572X AM571X"

do_compile() {
  oe_runmake -f ipc-bios.mak clean
  oe_runmake -f ipc-bios.mak release

  cd ${S_ipc-metadata}
  oe_runmake .all-files IPC_INSTALL_DIR="${S}" \
    BUILD_HOST_OS="linux" \
    RELEASE_TYPE="${RELEASE_TYPE}"

  cd ${S_ipc-examples}/src
  oe_runmake .examples \
    IPCTOOLS="${S_ipc-metadata}/src/etc"
  for alt_platform in ${ALT_PLATFORM}; do
    oe_runmake .examples \
      IPCTOOLS="${S_ipc-metadata}/src/etc" \
      PLATFORM=${alt_platform}
  done

  if [  "${PLATFORM}" != "UNKNOWN" ]; then
    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${S}"
    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${S}"

    for alt_platform in ${ALT_PLATFORM}; do
      oe_runmake extract PLATFORM=${alt_platform} HOSTOS="bios" IPC_INSTALL_DIR="${S}"
      oe_runmake extract PLATFORM=${alt_platform} HOSTOS="linux" IPC_INSTALL_DIR="${S}"
    done
  fi

  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
  install -d ${IPC_PACKAGE_DIR}
  # Copy docs and other meta files
  cp -pPrf  ${S_ipc-metadata}/exports/ipc_${IPC_VERSION}/* -d ${IPC_PACKAGE_DIR}

  # Copy example folders corresponding to the platforms
  if [  "${PLATFORM}" != "UNKNOWN" ]; then
    install -d ${IPC_PACKAGE_DIR}/examples
    cp -pPf ${S_ipc-examples}/src/examples/*.* ${IPC_PACKAGE_DIR}/examples/
    cp -pPf ${S_ipc-examples}/src/examples/makefile ${IPC_PACKAGE_DIR}/examples/
    cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}* ${IPC_PACKAGE_DIR}/examples/
    for alt_platform in ${ALT_PLATFORM}; do
      cp -pPrf ${S_ipc-examples}/src/examples/${alt_platform}* ${IPC_PACKAGE_DIR}/examples/
    done
    find ${IPC_PACKAGE_DIR}/examples/ -name "*zip" -type f | xargs -I {} rm {}
  fi
}
