PR:append = ".psdk0"

QT5_ESSENTIALS:remove = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-qmlplugins', d)} \
"

QT5_ESSENTIALS:append = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebkit-qmlplugins', d)} \
"
