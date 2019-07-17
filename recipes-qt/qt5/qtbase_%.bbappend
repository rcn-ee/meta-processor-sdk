PR_append = ".tisdk5.7"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'wayland', '', d)}"

QT_NOSGX_PATCHES = "\
    file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
    file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
    file://quit.png \
"

SRC_URI += "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', "${QT_NOSGX_PATCHES}", d)}\
    file://0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch \
"

python do_patch_append() {
    import shutil

    work_dir = d.getVar("WORKDIR", True)
    s = d.getVar("S", True)

    if not bb.utils.contains('MACHINE_FEATURES','gpu',True,False,d):
        shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
}

