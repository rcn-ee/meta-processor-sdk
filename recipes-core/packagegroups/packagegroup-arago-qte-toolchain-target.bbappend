PR:append = ".psdk0"

QT5_DEV:remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-mkspecs qtwebengine-dev', d)} \
"

QT5_DEV:append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', ' qtwebkit-mkspecs qtwebkit-dev qtquick1-dev', d)} \
"
