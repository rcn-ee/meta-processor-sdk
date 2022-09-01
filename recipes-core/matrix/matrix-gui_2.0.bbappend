PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://qwindow \
"
do_install_append(){

	# Install qwindow script
	install -m 0755 ${WORKDIR}/qwindow ${D}${sysconfdir}/init.d/qwindow
}

SYSTEMD_AUTO_ENABLE_${PN}_am62xx-evm = "disable"
SYSTEMD_AUTO_ENABLE_${PN}_am62xx-lp-evm = "disable"
