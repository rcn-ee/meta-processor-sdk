inherit ti-pdk
require recipes-bsp/common-csl-ip/common-csl-ip.inc

DEPENDS_remove = "${PN}"

COMPATIBLE_MACHINE_append = "|ti33x|ti43x"

PR = "r0.ti-int3"

SRC_URI = "git://gtgit02.gt.design.ti.com/git/projects/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"
BRANCH = "releases/PROCESSOR-SDK.01.00.00"
SRCREV = "2e6dc751ddc604dc3df2d4f2e46a7f8f77f07131"
SRCREV_dra7xx = "2e6dc751ddc604dc3df2d4f2e46a7f8f77f07131"

SRC_URI_append = "\
    file://enable_build_of_specific_device.patch \
"

XDCARGS = ""
XDCARGS_ti33x = "am335x"
XDCARGS_ti43x = "am437x"
XDCARGS_omap-a15 = "am571x am572x"
