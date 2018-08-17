PR_append = ".tisdk5"
PV = "1.8+"

BRANCH = "ti-linuxptp-release"
SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
           file://build-Allow-CC-and-prefix-to-be-overriden.patch"

SRCREV = "0c391227944873895a8f815229bc68f2b8cc8b1b"

S = "${WORKDIR}/git"

do_install_append() {
    install -p ${S}/phc_ctl  ${D}${bindir}
    install -p ${S}/timemaster  ${D}${bindir}
}
