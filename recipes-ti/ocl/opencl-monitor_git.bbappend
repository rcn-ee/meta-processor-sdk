PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/ocl:"

SRC_URI_append = " \
    file://0001-Platform.xdc-Consolidate-DDR3-memory.patch;patchdir=${WORKDIR}/git;pnum=1 \
"
