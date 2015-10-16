inherit ti-pdk
require recipes-bsp/common-csl-ip/common-csl-ip.inc

DEPENDS_remove = "${PN}"

COMPATIBLE_MACHINE_append = "|ti33x|ti43x|keystone"

PR = "r1.ti-int5"

SRC_URI = "git://gtgit02.gt.design.ti.com/git/projects/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"
BRANCH = "releases/PROCESSOR-SDK.01.00.00"
BRANCH_keystone = "master"
SRCREV = "829b1e60756b8d8180fe978c14365563961b0396"
SRCREV_dra7xx = "829b1e60756b8d8180fe978c14365563961b0396"
SRCREV_keystone = "7ab73f3c25f10445969e7836156c0b875e90482b"

XDCARGS = ""
XDCARGS_ti33x = "am335x"
XDCARGS_ti43x = "am437x"
XDCARGS_omap-a15 = "am571x am572x"
XDCARGS_keystone = "k2hk"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
