DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
SECTION = "devel"
LICENSE = "BSD & GPLv2"

require recipes-ti/includes/ti-paths.inc
require recipes-ti/includes/ti-staging.inc

PV = "3_31_01_33"
PR = "r0"

LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=50760561aa64576fda0268a7c6704591"

SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"

SRC_URI[xdczip.md5sum] = "6783d4fca66551d87f9fd069d77d258d"
SRC_URI[xdczip.sha256sum] = "dc57e76ccc8440534228f6b0b055fb3cbfefd40fffb450678083d3023f26a04a"

S = "${WORKDIR}/xdctools_${PV}_core"

do_install() {
    install -d ${D}${XDC_INSTALL_DIR_RECIPE}
    cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
}

FILES_${PN} += "${XDC_INSTALL_DIR_RECIPE}"

INSANE_SKIP_${PN} = "arch ldflags libdir textrel"

# Prevent internal libs from getting picked up
PRIVATE_LIBS = " \
libncdb.so \
libcdb.so \
libjavaplugin_oji.so \
libjavaplugin_jni.so \
libjsound.so \
libinstrument.so \
libjawt.so \
libzip.so \
libjava_crw_demo.so \
libjavaplugin_nscp_gcc29.so \
libhprof.so \
libcmm.so \
libjdwp.so \
libmlib_image.so \
libjpeg.so \
libverify.so \
libjavaplugin_nscp.so \
libmanagement.so \
libunpack.so \
librmi.so \
libJdbcOdbc.so \
libawt.so \
libnet.so \
libjaas_unix.so \
libnio.so \
libdcpr.so \
libioser12.so \
libjsoundalsa.so \
libjava.so \
libfontmanager.so \
libdt_socket.so \
libmawt.so \
libjvm.so \
libhpi.so \
lib.so \
libcairo.so.2 \
"
