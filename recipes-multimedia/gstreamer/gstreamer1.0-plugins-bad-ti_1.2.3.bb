require recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_${PV}.bb

DESCRIPTION = "GStreamer bad plugins that fix DRM and wayland support for TI devices"

PR = "r2"

# Set PROVIDES and RPROVIDES values so that the base recipe names can still
# be used and PREFERRED_PROVIDER can be used to pick between them.
PROVIDES += "gstreamer1.0-plugins-bad"
RPROVIDES_${PN} += "gstreamer1.0-plugins-bad"
RPROVIDES_${PN}-dev += "gstreamer1.0-plugins-bad-dev"
RPROVIDES_${PN}-meta += "gstreamer1.0-plugins-bad-meta"
RREPLACES_${PN} += "gstreamer1.0-plugins-bad"
RREPLACES_${PN}-dev += "gstreamer1.0-plugins-bad-dev"
RREPLACES_${PN}-meta += "gstreamer1.0-plugins-bad-meta"
RCONFLICTS_${PN} += "gstreamer1.0-plugins-bad"
RCONFLICTS_${PN}-dev += "gstreamer1.0-plugins-bad-dev"
RCONFLICTS_${PN}-meta += "gstreamer1.0-plugins-bad-meta"

PACKAGECONFIG = "faad"

PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"

DEPENDS_append_omap-a15 = " \
    libdce \
    libdrm \
"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRCREV = "22f32534ce54035c33c8e788b46dc257621b472c"

SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git \
           file://0006-GstDRMBufferPool-support-fix.patch \
"

S = "${WORKDIR}/git"

python split_gstreamer10_packages () {
    def gst_lib_hook(file, pkg, pattern, format, basename):
        pkglist = " lib" + basename + " lib" + basename + "-0"
        d.setVar("DEBIAN_NOAUTONAME_" + pkg, "1")
        d.appendVar("RPROVIDES_" + pkg, pkglist)
        d.appendVar("RREPLACES_" + pkg, pkglist)
        d.appendVar("RCONFLICTS_" + pkg, pkglist)

    gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
    postinst = d.getVar('plugin_postinst', True)
    glibdir = d.getVar('libdir', True)

    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s-ti', 'gstreamer %s library', extra_depends='', allow_links=True, hook=gst_lib_hook)
    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
}
