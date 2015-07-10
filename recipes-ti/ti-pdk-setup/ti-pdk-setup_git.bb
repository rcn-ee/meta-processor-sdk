DESCRIPTION = "Package containing scripts to setup the PDK development environment"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://pdksetupenv.sh;beginline=1;endline=20;md5=19359852b140a148fd4399d93d26d0e8"

require recipes-ti/includes/ti-paths-append.inc

PR = "r0"

BRANCH = "releases/procsdk_01_xx"
SRCREV = "d8f329b0ef517282ce0b61747b0878b940c8dd07"
SRC_URI = "git://gtgit02.gt.design.ti.com/git/projects/keystone-2-csl-lld.git;protocol=git;branch=${BRANCH}"

S = "${WORKDIR}/git/ti/release/full/"

do_compile() {
  :
}

do_install() {
  install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages

  install -m 0755 armv7setupenv.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdksetupenv.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 makefile ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdksetupenv.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkbuilder.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkbuilder.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkProjectCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 pdkProjectCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 macros.ini ${D}${PDK_INSTALL_DIR_RECIPE}/packages
  install -m 0755 "API Documentation.html" ${D}${PDK_INSTALL_DIR_RECIPE}/packages
}

ALLOW_EMPTY_${PN} = "1"
FILES_${PN}-dev += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
