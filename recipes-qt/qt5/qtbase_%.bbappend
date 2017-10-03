PR_append = ".tisdk5"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
include qt5-path-hack.inc

GLES_EXTRA_DEPS = "libdrm libgbm ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"

# kms packageconfig requires virtual/mesa
#
# Seems that there is a patch missing on morty which exists for both krogoth and
# master. (63f018e5a795e30f913ead00e840ad3263cb0edf)
#
# Implement the patch here
PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
PACKAGECONFIG += "kms"

PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,virtual/libgles2"
PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,virtual/libgles2"
PACKAGECONFIG[xfixes] = "-xfixes,-no-xfixes,virtual/libgles2"
PACKAGECONFIG[xrandr] = "-xrandr,-no-xrandr,virtual/libgles2"
PACKAGECONFIG[xrender] = "-xrender,-no-xrender,virtual/libgles2"
PACKAGECONFIG[xshape] = "-xshape,-no-xshape"
PACKAGECONFIG[xsync] = "-xsync,-no-xsync"
PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,virtual/libgles2"
PACKAGECONFIG[glib] = "-glib,-no-glib,virtual/libgles2"

PACKAGECONFIG_X11_FORCE = " xsync xshape xrender xrandr xfixes xinput2 xcursor glib xkb "

PACKAGECONFIG_append = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', "${PACKAGECONFIG_X11_FORCE}", '', d)}"

QT_NOSGX_PATCHES = "\
    file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
    file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
    file://quit.png \
"

SRC_URI += "\
    ${@['',"${QT_NOSGX_PATCHES}"][bb.utils.contains('MACHINE_FEATURES','sgx',False,True,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
    file://0001-qtbase-enhance-eglfs_kms-to-handle-DRM-plane-set-req.patch        \
"

python do_patch_append() {
    import shutil

    work_dir = d.getVar("WORKDIR", True)
    s = d.getVar("S", True)

    if not bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d):
        shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
}

