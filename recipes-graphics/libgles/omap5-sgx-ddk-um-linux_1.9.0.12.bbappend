PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://powervr.ini \
"

SRCREV_ti33x    = "e527b3e6a548fe5b5fb743dde357a817e0b33d6f"
SRCREV_ti43x    = "e527b3e6a548fe5b5fb743dde357a817e0b33d6f"
