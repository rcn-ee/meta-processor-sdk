require recipes-ti/ipc/ti-ipc-rtos.inc
require recipes-ti/includes/ti-paths-append.inc

PV = "3_40_01_08"
PR = "r1"

LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"

SRC_URI[ipczip.md5sum] = "738e1d54da9fab94899ad162f1ad78de"
SRC_URI[ipczip.sha256sum] = "8cc7d40ad7eab916eae109b355dc7e7876c6ab82e3b40bf5b6bf60474312d6cf"

PACKAGE_ARCH = "${MACHINE_ARCH}"

DEPENDS += "ti-ccsv6-native ti-xdctools ti-sysbios"

PLATFORM = "UNKNOWN"
PLATFORM_omap5-evm = "OMAP54XX"
PLATFORM_dra7xx = "DRA7XX"
PLATFORM_k2hk-evm = "TCI6638"
PLATFORM_k2l-evm = "TCI6630"
PLATFORM_k2e-evm = "66AK2E"

IPC_TARGETS = ""
IPC_TARGETS_omap-a15 = "\
    gnu.targets.arm.A15F="${A15_TOOLCHAIN_INSTALL_DIR}" \
"

EXTRA_OEMAKE = "\
    PLATFORM="${PLATFORM}" \
    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
    ${IPC_TARGETS} \
"

do_compile() {
  :
}

do_compile_omap-a15() {
  oe_runmake -f ipc-bios.mak all
}

do_compile_append() {
  sourceipk_do_create_srcipk
}
