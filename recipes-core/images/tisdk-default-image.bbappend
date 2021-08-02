PR_append = ".tisdk0"

IMAGE_INSTALL_append_am64xx-evm += "\
    dropbear \
    linuxptp \
    iproute2 \
    tensorflow-lite \
"

# Extra boot files for WIC images
do_image_wic_append_am64xx-evm[depends] += " wifi-oob:do_deploy"
IMAGE_BOOT_FILES_append_am64xx-evm += " wificfg"
