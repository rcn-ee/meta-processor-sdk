PR:append = ".psdk0"

QT5_DEMOS:remove = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-examples', d)} \
"

QT5_DEMOS:append = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebkit-examples-examples', d)} \
"
