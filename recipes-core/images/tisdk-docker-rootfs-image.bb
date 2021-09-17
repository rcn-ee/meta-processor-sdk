require recipes-core/images/arago-image.inc

# Enable basic conveniences, kernel-modules, etc...
IMAGE_INSTALL += "packagegroup-arago-base \
                  packagegroup-arago-tisdk-connectivity \
                  packagegroup-arago-console"

# Add docker and dropbear for SSH server
IMAGE_INSTALL += "docker dropbear"

export IMAGE_BASENAME = "tisdk-docker-rootfs-image"

WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
# Extra boot files for WIC images
do_image_wic_append_am64xx-evm[depends] += " wifi-oob:do_deploy"
IMAGE_BOOT_FILES_append_am64xx-evm += " wificfg"
