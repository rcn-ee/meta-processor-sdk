PR_append = ".tisdk2"

# Workaround attempt to setup cross-compile environment
EXTRA_OEMAKE += " CPP="${CXX}" \
                  UNAME_M="bypass" \
"
