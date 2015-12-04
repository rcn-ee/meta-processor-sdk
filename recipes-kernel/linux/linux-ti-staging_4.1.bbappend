PR_append = ".tisdk19"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:${THISDIR}/files:"

SRCREV = "a8a658a2f93e75c212e95e9b0778cfa15b3d3417"

include ti-uio.inc

SRC_URI_append = " \
    file://0001-HACK-remoteproc-Prevent-backtrace-for-RSC_INTMEM-dep.patch \
    file://0002-Added-DT-bindings-for-DebugSS.patch \
    file://0003-opp33xx_data-Enabled-1-GHz-for-2.0-Silicon.patch \
    file://0004-soc-ti-add-knav_dma_get_flow-to-retrieve-flow-of-giv.patch \
    file://0005-soc-ti-add-missing-include-to-knav_dma.h.patch \
    file://0006-crypto-keystone-keystone-sideband-crypto-driver.patch \
    file://0007-ARM-dts-k2hk-add-device-binding-for-crypto-accelerat.patch \
    file://0008-ti_config_fragments-connectivity.cfg-enable-INET_ESP.patch \
    file://0009-ARM-dts-k2l-add-device-binding-for-crypto-accelerato.patch \
    file://0010-ARM-dts-k2e-add-device-binding-for-crypto-accelerato.patch \
    file://0011-net-netcp-cpts-introduce-keystone-netcp-cpts-softwar.patch \
    file://0012-net-netcp-add-support-of-cpts.patch \
    file://0013-ARM-keystone-dts-add-gbe-and-10gbe-netcp-cpts-bindin.patch \
    file://0014-ti_config_fragments-connectivity.cfg-enable-keystone.patch \
"

do_compile_kernel_modules_append() {
	cp Module.symvers ${STAGING_KERNEL_BUILDDIR}/
}
