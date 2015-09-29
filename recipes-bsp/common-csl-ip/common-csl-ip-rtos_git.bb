inherit ti-pdk
require recipes-bsp/common-csl-ip/common-csl-ip.inc

DEPENDS_remove = "${PN}"

COMPATIBLE_MACHINE_append = "|ti33x|ti43x"

PR = "r1.ti-int5"

SRC_URI = "git://gtgit02.gt.design.ti.com/git/projects/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"
BRANCH = "releases/PROCESSOR-SDK.01.00.00"
SRCREV = "829b1e60756b8d8180fe978c14365563961b0396"
SRCREV_dra7xx = "829b1e60756b8d8180fe978c14365563961b0396"

XDCARGS = ""
XDCARGS_ti33x = "am335x"
XDCARGS_ti43x = "am437x"
XDCARGS_omap-a15 = "am571x am572x"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
