SUMMARY = "TI OpenVX HOST (Linux A15) conformance verification application, and Host side IPC implementation "
DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conformance test as well as additional TI specific tests. This package creates application which runs all the tests (7K-8K). Same package includes IPC implementation (MessageQ based) needed for communication with DSP firmware (loaded at boot time) "

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_1.0.0.0_manifest.html;md5=de53bc8bf67ffa9a316fe48e3bacbf6d"

require recipes-ti/includes/tisdk-paths.inc
require tiovx-sys.inc

DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem "
RDEPENDS_${PN} = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem "

PR = "r1"

COMPATIBLE_MACHINE = "dra7xx"
PACKAGE_ARCH = "${MACHINE_ARCH}"

PROCLIST = "host"

S = "${WORKDIR}/git"

EXTRA_OEMAKE += " TARGET_ROOTDIR=${STAGING_DIR_HOST} "
EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} TIOVXPATH=${TIOVX_INSTALL_DIR} IPCPATH=${IPC_INSTALL_DIR} "
EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface "
EXTRA_OEMAKE += " PROC_LIST=${PROCLIST} "

do_install () {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/host/bin/debug/app_host ${D}${bindir}/tiovx-app_host
}

FILES_${PN} += "${bindir}/*"
INSANE_SKIP_${PN} = "ldflags"
