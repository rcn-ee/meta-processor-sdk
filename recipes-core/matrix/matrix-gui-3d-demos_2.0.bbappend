PR_append = ".tisdk0"

SRCREV = "c6fe9957de117bc87c48a7d63205dfae923bb5b9"

PACKAGES_remove_omap-a15 = " \
            ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "matrix-3d-demo-kmscube", "", d)} \
            ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "matrix-3d-demo-kmscubevideo", "", d)} \
"

PACKAGES_remove_ti43x = " \
            ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "matrix-3d-demo-kmscube", "", d)} \
"

PACKAGES_remove_ti33x = " \
            ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "matrix-3d-demo-kmscube", "", d)} \
"
