PR_append = ".tisdk16"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

MAKEFILES_append_k2g-evm = " opencl-examples \
                             openmpacc-examples \
"

MAKEFILES_append_omap-a15 = " dual-camera-demo \
                              image-gallery \
"

MAKEFILES_append_dra7xx = " linalg-examples"
