PR_append = ".tisdk1"

DEPENDS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_DEPENDS_WEBENGINE}", d)} \
"

DEPENDS_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', " ${QT_DEPENDS_WEBKIT}", d)} \
"

#QT5_WEBENGINE_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
#QT5_WEBKIT_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"

#QT5_SRCREV = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', "${QT5_SRCREV}", "${QT5_WEBKIT_SRCREV}", d)}"
