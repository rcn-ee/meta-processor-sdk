PR_append = ".tisdk0"

QT5_DEV_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-mkspecs qtwebengine-dev', d)} \
"

QT5_DEV_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtwebkit-mkspecs qtwebkit-dev qtquick1-dev', d)} \
"
