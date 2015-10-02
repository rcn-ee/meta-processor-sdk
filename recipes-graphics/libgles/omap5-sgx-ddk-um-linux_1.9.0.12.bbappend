PR_append = ".tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://powervr.ini \
"

SRCREV_ti33x    = "e15f1543bab4de9e8927a2c4934addf3fd16ffcb"
SRCREV_ti43x    = "e15f1543bab4de9e8927a2c4934addf3fd16ffcb"

FILES_SOLIBSDEV = ""
