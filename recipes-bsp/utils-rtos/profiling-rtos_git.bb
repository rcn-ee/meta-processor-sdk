LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://profilingver.h;beginline=1;endline=46;md5=974494ad60f33cfc0340e421c5a5a7a0"

inherit ti-pdk
require utils.inc

S = "${WORKDIR}/git/profiling"

PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
