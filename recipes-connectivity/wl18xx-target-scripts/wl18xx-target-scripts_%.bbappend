PR:append = ".psdk0"

SRCREV = "fbb83426312f438a9248c1777ec3faa10a7ed55b"

SRC_URI:append:am64xx-evm = " \
    file://0001-Customize-hostapd.conf-for-am64xx-sk-wifi-oob-experi.patch \
    file://0002-Customize-wpa_supplicant.conf-for-am64xx-sk-wifi-oob.patch \
"

SRC_URI:append:am62xx-evm = " \
    file://0001-Customize-hostapd.conf-for-am62xx-sk-wifi-oob-experi.patch \
    file://0002-Customize-wpa_supplicant.conf-for-am62xx-sk-wifi-oob.patch \
"


SRC_URI:append:am62xx-lp-evm = " \
    file://0001-Customize-hostapd.conf-for-am62xx-sk-wifi-oob-experi.patch \
    file://0002-Customize-wpa_supplicant.conf-for-am62xx-sk-wifi-oob.patch \
"

FILESEXTRAPATHS:append := "${THISDIR}/files:"

PACKAGE_ARCH = "${MACHINE_ARCH}"
