PR_append = ".tisdk1"

QT5_DEMOS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-examples', d)} \
"

QT5_DEMOS_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebkit-examples-examples', d)} \
"
