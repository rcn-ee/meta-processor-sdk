require recipes-ti/ipc/ti-ipc-rtos.inc
require recipes-ti/includes/ti-paths-append.inc

PV = "3_40_01_08"
PR = "r2"

LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"

SRC_URI[ipczip.md5sum] = "738e1d54da9fab94899ad162f1ad78de"
SRC_URI[ipczip.sha256sum] = "8cc7d40ad7eab916eae109b355dc7e7876c6ab82e3b40bf5b6bf60474312d6cf"

PACKAGE_ARCH = "${MACHINE_ARCH}"

DEPENDS += "ti-ccsv6-native ti-cgt6x-native ti-xdctools ti-sysbios"

IPC_TARGETS = ""
IPC_TARGETS_omap-a15 = "\
    gnu.targets.arm.A15F="${A15_TOOLCHAIN_INSTALL_DIR}" \
    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
    ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
"

IPC_TARGETS_keystone = " \
    gnu.targets.arm.A15F="${A15_TOOLCHAIN_INSTALL_DIR}" \
    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
"

EXTRA_OEMAKE = "\
    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
    ${IPC_TARGETS} \
"

do_compile() {
  oe_runmake -f ipc-bios.mak clean
  oe_runmake -f ipc-bios.mak libs
}

do_compile_append() {
  sourceipk_do_create_srcipk
}

INSANE_SKIP_${PN}-dev += "arch"
