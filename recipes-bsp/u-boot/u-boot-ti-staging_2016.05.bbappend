PR_append = ".tisdk0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-2016.05:"

SRC_URI_append_k2g = " \
    file://0001-ARM-dts-k2g-ice-add-tx-internal-delay-for-dp83867-cl.patch \
    file://0002-net-phy-dp83867-add-4-level-strap-mode-1-support.patch \
    file://0003-ARM-dts-k2g-ice-dp83867-configure-4-level-strap-mode.patch \
"

PATCHTOOL = "git"
