inherit ti-pdk
require recipes-bsp/common-csl-ip/common-csl-ip.inc

DEPENDS_remove = "${PN}"

COMPATIBLE_MACHINE_append = "|ti33x|ti43x"

PR = "r0.ti-int1"

SRC_URI = "git://gtgit02.gt.design.ti.com/git/projects/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"
BRANCH = "releases/PROCESSOR-SDK.01.00.00"
SRCREV = "de22fd0c48ef9884e5dea405934525d3a6be5eba"
SRCREV_dra7xx = "de22fd0c48ef9884e5dea405934525d3a6be5eba"
