FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PR:append = ".psdk0"

SRC_URI += " \
    file://sudoers-weston \
"

EXTRA_USERS_PARAMS += " \
    usermod -aG docker weston; \
    usermod -p '' weston; \
"

do_install:append() {
    install -d ${D}${sysconfdir}/sudoers.d/
    install  ${WORKDIR}/sudoers-weston ${D}${sysconfdir}/sudoers.d/
}

FILES:${PN} += " ${sysconfdir}/sudoers.d/sudoers-weston"
