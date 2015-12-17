require recipes-bsp/qmss-lld/qmss-lld.inc

QMSS_LLD_SRCREV = "6b093515f38c6e4d3a8014903a563a9b89fd7c98"

PV = "02.01.00.12"

FILESEXTRAPATHS_prepend := "${THISDIR}/qmss-lld:"

SRC_URI_append = " \
    file://qmss-ld-fix-firmware-installation.patch \
"
