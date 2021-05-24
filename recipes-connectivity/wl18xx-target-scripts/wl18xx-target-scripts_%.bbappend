PR_append=".tisdk0"

SRCREV = "fbb83426312f438a9248c1777ec3faa10a7ed55b"
SRC_URI_append_am64xx-sk = " \
    file://0001-Customize-hostapd.conf-for-am64xx-sk-wifi-oob-experi.patch \
    file://0002-Customize-wpa_supplicant.conf-for-am64xx-sk-wifi-oob.patch \
"

FILESEXTRAPATHS_append := "${THISDIR}/files:"

PACKAGE_ARCH="${MACHINE_ARCH}"
