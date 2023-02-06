LICENSE="GPLv2"
DESCRIPTION = "Sysrepo based repo to configure EST"
LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=a30edb92a9457108af579938d76f5a4c"

SRC_URI = "file://nw-configurator.c"

S = "${WORKDIR}"

FILES_${PN}-dev = "${includedir}"

DEPENDS = "sysrepo"

inherit autotools pkgconfig

do_compile() {
	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${WORKDIR}/nw-configurator.c -o nw-configurator -lsysrepo
}

BBCLASSEXTEND = "native nativesdk"

do_install() {
	install -d ${D}${bindir}
	install -m 0755 nw-configurator ${D}${bindir}
}

