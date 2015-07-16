require ti-ndk.inc

PV = "2_24_01_18"
PR = "r0"

LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=90defb043f616ab6fcd48852f0d4d151"

SRC_URI[ndkzip.md5sum] = "905be963ec193b5cd1726872a7c1a811"
SRC_URI[ndkzip.sha256sum] = "3bfa250b7c72d0c1ad9e38d6bbabe995dd342cfab106dbbf7051c345bc6c94d9"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "ndk_${PV}"
