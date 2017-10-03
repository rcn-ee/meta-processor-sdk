PR_append = ".tisdk0"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'experimental', 'master', d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '099620ad69301796887f382471208741b4cf831b', 'd19016b30d99973135e03c48978a0b88983b4b0d', d)}"

do_install_append () {

    if [ "${@bb.utils.contains('MACHINE_FEATURES','xsgx','true','false',d)}" = "true" ]; then

       install -d ${D}${bindir}/SGX/demos/X11/

       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/X11/
       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2Coverflow ${D}${bindir}/SGX/demos/X11/
       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2ExampleUI ${D}${bindir}/SGX/demos/X11/
       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2Navigation ${D}${bindir}/SGX/demos/X11/
       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2MagicLantern ${D}${bindir}/SGX/demos/X11/
       install -m 755 ${S}/targetfs/Examples/Advanced/X11/OGLES2FilmTV ${D}${bindir}/SGX/demos/X11/
    fi
}
