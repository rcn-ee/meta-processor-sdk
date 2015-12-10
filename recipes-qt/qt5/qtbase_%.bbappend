FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PR_append = ".tisdk0"

QT_EGLFS_PATCHES += " \
    file://0001-EGLFS-Disable-SIGTERM-so-that-it-may-be-handled-by-u.patch \
"
