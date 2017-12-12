PR_append = ".tisdk0"

QT5_ESSENTIALS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-qmlplugins', d)} \
"

QT5_ESSENTIALS_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtwebkit-qmlplugins qtquick1-plugins qtquick1-qmlplugins', d)} \
"
