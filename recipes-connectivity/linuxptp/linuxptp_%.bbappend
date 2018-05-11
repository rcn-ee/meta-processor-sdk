PR_append = ".tisdk3"
PV = "1.8+"

BRANCH = "ti-linuxptp-release"
SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
           file://build-Allow-CC-and-prefix-to-be-overriden.patch"

SRCREV = "d6700594b2484d548a0cb4e9576fbdaf53056d5d"

S = "${WORKDIR}/git"

do_install_append() {
    install -p ${S}/phc_ctl  ${D}${bindir}
    install -p ${S}/timemaster  ${D}${bindir}
}
