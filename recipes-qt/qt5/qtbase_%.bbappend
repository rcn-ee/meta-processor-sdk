PR_append = ".tisdk3"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

GLES_EXTRA_DEPS = "libdrm ${@base_contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"

# kms packageconfig requires virtual/mesa
#
# Seems that there is a patch missing on morty which exists for both krogoth and
# master.
#
# Disable until this can be resolved upstream.
#PACKAGECONFIG += "kms"

QT_NOSGX_PATCHES = "\
    file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
    file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
    file://quit.png \
"

# Patch needs to be updated
#    file://0001-qtbase-enhance-eglfs_kms-to-handle-DRM-plane-set-req.patch 
SRC_URI += "\
    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_NOSGX_PATCHES}", d)}\
"

python do_patch_append() {
    import shutil

    work_dir = d.getVar("WORKDIR", True)
    s = d.getVar("S", True)

    if not bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d):
        shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
}

