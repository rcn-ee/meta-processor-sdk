PR_append = ".tisdk18"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
    file://Makefile_ti-gc320-driver \
"

MAKEFILES_append_k2g-evm = " opencl-examples \
                             openmpacc-examples \
"

MAKEFILES_append_omap-a15 = " dual-camera-demo \
                              image-gallery \
                              uio-module-drv \
                              ti-gc320-driver \
"

MAKEFILES_append_dra7xx = " linalg-examples"
