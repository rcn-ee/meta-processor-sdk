DESCRIPTION="Interface for GDB to commincate witha TI C66X DSP"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"

include gdbc6x.inc

COMPATIBLE_MACHINE = "dra7xx"
PACKAGE_ARCH = "${MACHINE_ARCH}"

# This package builds a kernel module, use kernel PR as base and append a local
MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
PR = "${MACHINE_KERNEL_PR}"

PLATFORM = ""
PLATFORM_dra7xx = "DRA7xx_PLATFORM"

EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"

S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"

module_autoload_gdbserverproxy = "gdbserverproxy"

inherit module

do_configure[noexec] = "1"
do_qa_configure[noexec] = "1"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
SRCIPK_PACKAGE_ARCH = "${MACHINE_ARCH}"
