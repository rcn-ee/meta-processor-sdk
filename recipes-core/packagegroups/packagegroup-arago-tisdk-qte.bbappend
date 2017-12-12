PR_append = ".tisdk0"

QT5_DEMOS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-examples', d)} \
"

QT5_DEMOS_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtquick1-examples qtwebkit-examples-examples', d)} \
"
