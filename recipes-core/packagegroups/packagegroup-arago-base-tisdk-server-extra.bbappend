PR_append = ".tisdk12"

ARAGO_TI_PKGS_append_keystone = " mmap-lld"

RDEPENDS_${PN}_remove = "recovery-kernel \
                         kexec \
                         kdump \
                         ipsec-tools \
"

RDEPENDS_${PN}_append = " \
    parse-ip \
"
