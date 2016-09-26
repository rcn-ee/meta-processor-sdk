PR_append = ".tisdk1"

IMAGE_INSTALL += "\
    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl-extra','',d)} \
"

IMAGE_INSTALL_append_ti43x = "packagegroup-arago-tisdk-graphics"
IMAGE_INSTALL_append_ti33x = "packagegroup-arago-tisdk-graphics"
