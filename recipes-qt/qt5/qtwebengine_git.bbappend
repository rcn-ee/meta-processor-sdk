PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-Fix-crash-in-WebEngineContext-when-using-Wayland.patch \
	file://0001-HACK-quota-client_usage_tracker-fix-a-mysterious-cra.patch \
"
