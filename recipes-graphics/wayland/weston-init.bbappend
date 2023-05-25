FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PR:append = ".psdk0"

SRC_URI:append = " \
    file://weston-init.service \
"

do_install:append() {

   install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
   sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston

   install -d ${D}${sysconfdir}/systemd/system
   install -D -p -m0644 ${WORKDIR}/weston-init.service ${D}${sysconfdir}/systemd/system/weston.service
   install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${sysconfdir}/systemd/system
}

FILES:${PN}:append = "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini ${sysconfdir}/systemd/system/weston.service ${sysconfdir}/systemd/system/weston.socket /lib/*"

SYSTEMD_SERVICE:${PN} = "weston.service"

INITSCRIPT_NAME = ""
INITSCRIPT_PARAMS = ""
