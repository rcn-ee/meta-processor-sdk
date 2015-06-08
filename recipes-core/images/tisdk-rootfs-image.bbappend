PR_append = "-tisdk1"

IMAGE_INSTALL += "\
    packagegroup-arago-tisdk-dev \
"

BAD_RECOMMENDATIONS += " \
    ti-llvm3.3-dev \
    opencl-monitor-dev \
    libulm-dev \
    gdbserver-c6x-dev \
"
