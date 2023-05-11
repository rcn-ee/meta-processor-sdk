SUMMARY = "Sitara Benchmark IPC Linux App"
LICENSE = "BSD-3-Clause & MIT"

inherit systemd

SRC_URI = " \
    git://git.ti.com/processor-sdk/sitara-apps.git;protocol=git;branch=master \
"
SRCREV = "89cd7d9d048231bc6f9f504f9b705e7655b0e085"

LIC_FILES_CHKSUM = " \
    file://rpmsg_json.c;endline=37;md5=20101a2f531854f0c7fd8b99b6fe6f32 \
    file://jsmn.h;endline=23;md5=c56db537a1570530f80115c3ad355575 \
"

S = "${WORKDIR}/git/benchmark_demo/webserver_app/linux_app"

TARGET_CC_ARCH += "${LDFLAGS}"

do_install() {
    # install linux user space IPC app
    install -d ${D}${bindir}/
    install -m 0744 ${S}/rpmsg_json ${D}${bindir}/

    # Install service file
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 rpmsg_json.service \
                    ${D}${systemd_system_unitdir}/rpmsg_json.service
}

SYSTEMD_SERVICE:${PN} = "rpmsg_json.service"

PR = "r1"
