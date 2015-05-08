PR_append = "-tisdk0"

# look for files in this layer first
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://fix-race-condition-during-install.patch \
"
