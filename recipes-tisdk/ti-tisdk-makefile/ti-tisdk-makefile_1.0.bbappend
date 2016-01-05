PR_append = ".tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://Makefile_qt-opencv-opencl-opengl-multithreaded \
"

MAKEFILES_append_dra7xx += " \
    qt-opencv-opencl-opengl-multithreaded \
"

MAKEFILES_append_k2hk-evm = " \
    opencl-examples \
    gdbserverproxy-module-drv \
    debugss-module-drv \
"

MAKEFILES_append_k2l-evm = " \
    opencl-examples \
    gdbserverproxy-module-drv \
    debugss-module-drv \
"

MAKEFILES_append_k2e-evm = " \
    opencl-examples \
    gdbserverproxy-module-drv \
    debugss-module-drv \
"

PLATFORM_DEBUGSS_keystone = "KEYSTONE_PLATFORM"

PLATFORM_GDBSERVERPROXY_keystone = "KEYSTONE_PLATFORM"

KERNEL_DEVICETREE_append_ti43x = " am43x-epos-evm-hdmi.dtb \
                                   am437x-gp-evm-hdmi.dtb \
                                   am437x-idk-evm.dtb"

KERNEL_DEVICETREE_append_dra7xx = " am572x-idk.dtb \
                                    am571x-idk.dtb \
                                    am572x-idk-lcd-osd.dtb \
                                    am571x-idk-lcd-osd.dtb"
