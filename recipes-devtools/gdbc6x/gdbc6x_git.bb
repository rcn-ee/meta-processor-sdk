DESCRIPTION="GNU debugger for TI C6X DSP."

LICENSE = "GPLv3+"
SECTION = "devel"
DEPENDS = "expat ncurses readline"

LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f"

include gdbc6x.inc

PR = "${INC_PR}.0"

DEPENDS = "ncurses bison texinfo flex gettext"

RDEPENDS_${PN}  = "gdbserver-c6x gdbserverproxy-module-drv"

S = "${WORKDIR}/git/gdbc6x"

SRC_URI_append = " \
    file://init \
"

inherit update-rc.d

INITSCRIPT_NAME = "gdbserverproxy"
INITSCRIPT_PARAMS = "defaults 95"

inherit gettext

PARALLEL_MAKE = ""

do_configure () {
    cd ${S}
    ./configure --program-suffix=c6x --target=tic6x-elf-tirtos --host=${HOST_SYS} --prefix=${S}/install_gdb
}

do_install () {
    make install

    # Custom install to prevent conflict with standard GDB.
    install -d ${D}${bindir}
    install -d ${D}${includedir}
    install -m 755  ${S}/install_gdb/bin/gdbc6x ${D}${bindir} 
    cp -rf ${S}/install_gdb/include/* ${D}${includedir}

    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
}
