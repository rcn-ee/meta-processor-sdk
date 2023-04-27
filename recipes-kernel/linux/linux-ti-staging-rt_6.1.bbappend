FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"

SRC_URI:append:am62xx-evm = " \
		${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0001-mm-vmalloc-Export-__get_vm_area_caller.patch", "", d)} \
        ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0002-arm-arm64-export-__hyp_stub_vectors.patch", "", d)} \        
        ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0003-mm-Re-export-ioremap_page_range.patch", "", d)} \
        ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0004-arm64-dts-add-reserved_memory-label-for-CMA-regions-.patch", "", d)} \
        ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0001-arm64-dts-Makefile-Update-makefile-to-build-overlay.patch", "", d)} \
        ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0006-mm-Allow-executable-ioremap-mappings.patch", "", d)} \
        ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "file://0007-arm64-dts-am625-base-board-Reserve-memory-for.patch", "", d)} \
"

PR:append = ".psdk0"
