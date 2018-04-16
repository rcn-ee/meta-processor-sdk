PR_append = ".tisdk16"

ARAGO_TI_PKGS_append_keystone = " mmap-lld"

#ARAGO_TI_PKGS_append_k2l-evm = "\
#    netapi \
#    netapi-test \
#"

#ARAGO_TI_PKGS_append_k2hk-evm = "\
#    netapi \
#    netapi-test \
#"

#ARAGO_TI_PKGS_append_k2e-evm = "\
#    netapi \
#    netapi-test \
#"

ARAGO_TI_KEYSTONE_PKGS_remove = " demo-image-proc"

RDEPENDS_${PN}_remove = "kexec \
                         kdump \
"
