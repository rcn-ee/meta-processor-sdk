PR_append = ".tisdk0"

IMAGE_INSTALL += "\
    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl-extra','',d)} \
"
