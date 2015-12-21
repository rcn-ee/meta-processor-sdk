EDMA3_LLD_SRCREV = "d648aada3c2dfc3f6a4acc0f0660f1ec0b0ed367"

PV = "2.12.01.22"

FILESEXTRAPATHS_prepend := "${THISDIR}/edma3-lld:"

SRC_URI_append = " \
    file://0001-Revert-edma3-add-CFLAGS_XDCINTERNAL-flag-in-rules_GC.patch \
    file://0002-edma3-k2h-fix-Linux-user-space-drv-rm-libs-build-err.patch \
"
