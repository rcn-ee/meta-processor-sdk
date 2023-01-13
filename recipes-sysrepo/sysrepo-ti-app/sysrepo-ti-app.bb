LICENSE="GPLv2"
DESCRIPTION = "Sample sysrepo based repo to configure EST"
LIC_FILES_CHKSUM = "file://sysrepo-ti-app.c;md5=97b357ad2a7c8be44762be84b2cc04a2"

SRC_URI = "file://sysrepo-ti-app.c"

S = "${WORKDIR}"

FILES_${PN}-dev = "${includedir}"

DEPENDS = "sysrepo"

inherit autotools pkgconfig

do_compile() {
	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${WORKDIR}/sysrepo-ti-app.c -o sysrepo-ti-app -lsysrepo
}

BBCLASSEXTEND = "native nativesdk"

do_install() {
	install -d ${D}${bindir}
	install -m 0755 sysrepo-ti-app ${D}${bindir}
}

