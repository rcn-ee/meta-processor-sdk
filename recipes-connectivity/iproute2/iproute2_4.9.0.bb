require iproute2.inc

SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
           file://configure-cross.patch \
           file://0001-iproute2-de-bash-scripts.patch \
           file://iproute2-4.9.0-musl.patch \
           file://0001-ip-HSR-Fix-cut-and-paste-error.patch \
           file://0002-add-support-for-prp-similar-to-hsr.patch \
          "

SRC_URI[md5sum] = "44a8371a4b2c40e48e4c9f98cbd41391"
SRC_URI[sha256sum] = "c0f30f043f7767cc1b2cd2197b08d4e9b2392c95823fabe30bbce308c30116c4"

# CFLAGS are computed in Makefile and reference CCOPTS
#
EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
