PR_append = ".tisdk2"

IMAGE_INSTALL_append_keystone = " \
    packagegroup-arago-test \
    packagegroup-arago-test-addons \
"

BAD_RECOMMENDATIONS += " \
    boost-dev \
    ti-llvm3.6-dev \
    opencl-monitor-dev \
    libulm-dev \
    gdbserver-c6x-dev \
    opencl-examples-dev \
    omp-runtime-dev \
"
