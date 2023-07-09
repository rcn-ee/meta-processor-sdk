PR:append = ".psdk0"

IMAGE_INSTALL:remove = " \
        packagegroup-arago-sysvinit-boot \
"

ARAGO_SYSVINIT = "0"

require recipes-core/images/tisdk-thinlinux-image.bb

IMAGE_INSTALL:remove = "\
        packagegroup-arago-base \
        packagegroup-arago-console \
        packagegroup-arago-base-tisdk \
        ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
        packagegroup-arago-tisdk-connectivity \
        packagegroup-arago-tisdk-crypto \
        docker \
        ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
"

export IMAGE_BASENAME = "tisdk-tiny-image"

WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"

IMAGE_INSTALL:append = " resize-rootfs "
