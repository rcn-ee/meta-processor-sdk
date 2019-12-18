SUMMARY = "Predictive maintenance demo for anomaly detection using Recurrent Neural Network (RNN)"
LICENSE = "Apache-2.0" 
LIC_FILES_CHKSUM = "file://../git/LICENSE;md5=34400b68072d710fecd0a2940a0d1658"

PV = "1.0"
PR = "r1"

BRANCH-NEO-AI-DLR = "dev"
SRC_URI = "git://github.com/TexasInstruments/neo-ai-dlr;protocol=https;branch=${BRANCH-NEO-AI-DLR};name=neo-ai-dlr \
           file://makefile;subdir=demosrc \
           file://Makefile.build;subdir=demosrc \
          "

SRCREV_neo-ai-dlr = "40394be2e39eaa6248f9bf0a1143692083c0e3d2"

S = "${WORKDIR}/demosrc"

DEPENDS += " opencv neo-ai-dlr "

do_patch_extra() {
   install -m 644 ${WORKDIR}/git/demo/cv/run_mobilenet_cv_mt.cc ${S}/.
   install -m 644 ${WORKDIR}/git/LICENSE ${S}/.
}
addtask patch_extra after do_patch before do_create_srcipk

do_compile() {
  cd ${S}
  make 
}

do_install() {
   install -d ${D}${datadir}/dlr/demos
   install -m 644 ${S}/run_mobilenet_cv_mt.cc ${D}${datadir}/dlr/demos/.
   install -m 644 ${S}/makefile ${D}${datadir}/dlr/demos/.
   install -m 644 ${S}/Makefile.build ${D}${datadir}/dlr/demos/.
   install -m 755 ${S}/run_mobilenet_cv_mt.dyn ${D}${datadir}/dlr/demos/.
}

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"

FILES_${PN} += " ${datadir}/dlr/demos "
