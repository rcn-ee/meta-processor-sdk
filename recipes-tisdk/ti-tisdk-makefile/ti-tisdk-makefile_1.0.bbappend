PR_append = "-tisdk7"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://Makefile_omapdrm-pvr \
            file://Makefile_debugss-module-drv \
            file://Makefile_gdbserverproxy-module-drv \
            file://Makefile_opencl-examples \
"

MAKEFILES_append_omap-a15 = " \
    omapdrm-pvr \
    debugss-module-drv \
    gdbserverproxy-module-drv \
    opencl-examples \
"

DEFCONFIG_omap-a15 = "tisdk_${MACHINE}_defconfig"

KERNEL_DEVICETREE_append_dra7xx = " am57xx-evm.dtb"

PLATFORM_DEBUGSS = ""
PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"

PLATFORM_GDBSERVERPROXY = ""
PLATFORM_GDBSERVERPROXY_dra7xx = "DRA7xx_PLATFORM"

do_install_append() {
    sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefile
    sed -i -e "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g" ${D}/Makefile
}
