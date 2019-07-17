PR_append = ".tisdk1"

QT5_DEMOS_remove = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-examples', d)} \
"

QT5_DEMOS_append = "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebkit-examples-examples', d)} \
"
