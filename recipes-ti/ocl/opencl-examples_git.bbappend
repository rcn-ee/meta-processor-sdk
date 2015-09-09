PR_append = ".tisdk1"

# Workaround attempt to setup cross-compile environment
EXTRA_OEMAKE += " CPP="${CXX}" \
                  UNAME_M="bypass" \
"

CREATE_SRCIPK = "1"
SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
