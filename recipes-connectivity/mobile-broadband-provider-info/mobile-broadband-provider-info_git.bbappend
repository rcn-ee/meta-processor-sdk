EXTRAPATHS_prepend := "${THISDIR}/${PN}:${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_remove = "\
	git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master \
"

SRC_URI_append = "\
	git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main \
"

PR_append = "_r0"

