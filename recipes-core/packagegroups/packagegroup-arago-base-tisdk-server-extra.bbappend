PR_append = ".tisdk10"

RDEPENDS_${PN}_remove = "recovery-kernel \
                         kexec \
                         kdump \
"

RDEPENDS_${PN}_append = " \
    parse-ip \
"
