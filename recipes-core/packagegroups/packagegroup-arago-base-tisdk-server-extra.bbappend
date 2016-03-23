PR_append = ".tisdk11"

ARAGO_TI_PKGS_append_keystone = " mmap-lld"

RDEPENDS_${PN}_remove = "recovery-kernel \
                         kexec \
                         kdump \
"

RDEPENDS_${PN}_append = " \
    parse-ip \
"
