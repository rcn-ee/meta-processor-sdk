PR_append = ".tisdk0"

LIC_FILES_CHKSUM = "file://ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadca4fb5599f508dc11fa1e752919"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://ipsecmgr_snoop_fp-Include-glibc-headers-first-to-prevent-conflict.patch \
"

S = "${WORKDIR}/git"

EXTRA_OEMAKE = "-C ./build"

do_compile() {
    oe_runmake clean
    oe_runmake
}

do_install_prepend() {
    cd ${S}/build
}
