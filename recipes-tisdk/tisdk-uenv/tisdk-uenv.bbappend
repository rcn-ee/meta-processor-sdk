PR_append = ".tisdk4"

FILESEXTRAPATHS_prepend := "${@"" if d.getVar("MACHINE") == "am62xx-evm" else "${THISDIR}/${PN}:"}"
