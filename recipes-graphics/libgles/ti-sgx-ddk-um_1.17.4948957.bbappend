PR_append = ".tisdk1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "dev/thud/${PV}-egl-experimental"
SRCREV = "0f76ac03750a4f6c09290abf6b9fced696ca192d"

RPROVIDES_${PN} += "libGLES_CM.so.1"

S = "${WORKDIR}/git"

do_install_append () {
    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
    ln -sf libGLESv1_CM.so ${D}${libdir}/libGLES_CM.so.1
    ln -sf libGLESv1_CM.so ${D}${libdir}/libGLES_CM.so

    rm -rf ${D}${includedir}/GL
}

FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"

