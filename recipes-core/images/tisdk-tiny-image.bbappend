PR:append = ".psdk0"

IMAGE_INSTALL:append:am65xx = " \
    kmod \
"

WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
