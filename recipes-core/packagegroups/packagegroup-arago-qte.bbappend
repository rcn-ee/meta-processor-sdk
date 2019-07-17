PR_append = ".tisdk1"

QT5_ESSENTIALS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-qmlplugins', d)} \
"

QT5_ESSENTIALS_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebkit-qmlplugins', d)} \
"
