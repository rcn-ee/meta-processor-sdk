PR_append = ".tisdk5.4"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"

# kms packageconfig requires virtual/mesa
#
# Seems that there is a patch missing on morty which exists for both krogoth and
# master. (63f018e5a795e30f913ead00e840ad3263cb0edf)
#
# Implement the patch here
PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
PACKAGECONFIG += "kms"

PACKAGECONFIG[gbm] = "-gbm,-no-gbm,drm virtual/egl"
PACKAGECONFIG += "gbm"

QT_NOSGX_PATCHES = "\
    file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
    file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
    file://quit.png \
"

SRC_URI += "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_NOSGX_PATCHES}", d)}\
    file://0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch \
"

python do_patch_append() {
    import shutil

    work_dir = d.getVar("WORKDIR", True)
    s = d.getVar("S", True)

    if not bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d):
        shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
}

