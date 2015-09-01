require ti-ndk.inc

PV = "2_24_03_35"
PR = "r0"

LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=5442913caee84f6492a3f33a9cb1117c"

SRC_URI[ndkzip.md5sum] = "b041025e95348f0fd73311c28d07da10"
SRC_URI[ndkzip.sha256sum] = "4129c6e939bdbdd0bc4a97e2698e7f55f72598917f4a128295855e9bd54b794e"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "ndk_${PV}"
