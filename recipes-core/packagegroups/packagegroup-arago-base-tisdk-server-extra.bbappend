PR_append = ".tisdk14"

ARAGO_TI_PKGS_append_keystone = " mmap-lld"

ARAGO_TI_KEYSTONE_PKGS_remove = " demo-image-proc"

RDEPENDS_${PN}_remove = "kexec \
                         kdump \
"
