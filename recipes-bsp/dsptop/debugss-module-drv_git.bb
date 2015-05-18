DESCRIPTION="Debug Sub-System (DebugSS) driver for Keystone and DRA7xx devices"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"

include dsptop.inc

COMPATIBLE_MACHINE = "dra7xx"
PACKAGE_ARCH = "${MACHINE_ARCH}"

# This package builds a kernel module, use kernel PR as base and append a local
MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
PR = "${MACHINE_KERNEL_PR}"

PLATFORM = ""
PLATFORM_dra7xx = "DRA7xx_PLATFORM"

EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}'"

S = "${WORKDIR}/git/debugss_module/debugss-mod"

inherit module

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
SRCIPK_PACKAGE_ARCH = "${MACHINE_ARCH}"
