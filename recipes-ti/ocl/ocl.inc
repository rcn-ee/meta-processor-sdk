PV = "1.1.2"
INC_PR = "r0"

LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"

FILESEXTRAPATHS_prepend := "${THISDIR}/ocl:"

BRANCH = "master"
SRC_URI = "git://git.ti.com/opencl/ti-opencl.git;protocol=git;branch=${BRANCH}"
SRCREV = "19ce282b5c84befe35e0d62c5cce4f5ad9a21bd4"
