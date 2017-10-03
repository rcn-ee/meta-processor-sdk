PR_append = ".tisdk8"

GRAPHICS_DEMO = ""
GRAPHICS_DEMO_omap-a15 = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', 'kmscube', d)} \
"

GRAPHICS_RDEPENDS_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-xsgx-ddk-km', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-xsgx-ddk-um', '', d)} \
"
GRAPHICS_RDEPENDS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-sgx-ddk-km', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'ti-sgx-ddk-um', '', d)} \
"
GRAPHICS_RDEPENDS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
"

RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
