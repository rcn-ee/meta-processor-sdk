PR_append = ".tisdk4"
PV = "1.8+"

BRANCH = "ti-linuxptp-release"
SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
           file://build-Allow-CC-and-prefix-to-be-overriden.patch"

SRCREV = "fac6d1e8cc4cef10fa2e6c8fd7c49779fcff50de"

S = "${WORKDIR}/git"

do_install_append() {
    install -p ${S}/phc_ctl  ${D}${bindir}
    install -p ${S}/timemaster  ${D}${bindir}
}
