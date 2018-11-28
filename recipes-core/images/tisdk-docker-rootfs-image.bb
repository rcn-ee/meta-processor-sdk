require recipes-core/images/arago-image.inc

# Enable basic conveniences, kernel-modules, etc...
IMAGE_INSTALL += "packagegroup-arago-base \
                  packagegroup-arago-tisdk-connectivity \
                  packagegroup-arago-console"

# Add docker and dropbear for SSH server
IMAGE_INSTALL += "docker docker-contrib dropbear"

export IMAGE_BASENAME = "tisdk-docker-rootfs-image"
