PR_append = ".tisdk69"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "\
    file://Makefile_video-graphics-test \
    file://Makefile_evse-hmi \
    file://Makefile_protection-relays-hmi \
    file://Makefile_tiovx-app-host \
    file://Makefile_tidl-examples \
    file://Makefile_pru-adc \
"

SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"


# FIXME: ti-crypto-examples require openssl 1.0, but devkit packages openssl 1.1
MAKEFILES_remove = "ti-crypto-examples"

MAKEFILES_append_k2g = " opencl-examples \
                         openmpacc-examples \
"

MAKEFILES_append_omap-a15 = " dual-camera-demo \
                              image-gallery \
                              big-data-ipc-demo \
			      evse-hmi \
                              video-graphics-test \
"

MAKEFILES_append_ti43x = " evse-hmi \
"

MAKEFILES_append_ti33x = " evse-hmi \
			   protection-relays-hmi \
"

MAKEFILES_append_k3 = " evse-hmi \
"

MAKEFILES_append_am335x-evm = " pru-adc"

MAKEFILES_append_am57xx-evm = " \
                                tidl-examples \
"
MAKEFILES_append_am57xx-hs-evm = " tidl-examples"

MAKEFILES_append_dra7xx = " tiovx-app-host"

MAKEFILES_remove_ti33x = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)}"
MAKEFILES_remove_ti43x = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)}"

MAKEFILES_remove_keystone = "hplib-mod ipsecmgr-mod"

# Populate UBOOT_MACHINE when UBOOT_CONFIG is used
# (see uboot-config.bbclass)
python() {
    ubootmachine = d.getVar("UBOOT_MACHINE", True)
    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
    # The "doc" varflag is special, we don't want to see it here
    ubootconfigflags.pop('doc', None)

    if ubootmachine and ubootconfigflags:
        bb.warn('UBOOT_MACHINE = "%s", UBOOT_CONFIG(flags) = "%s"' % (ubootmachine, ubootconfigflags))
        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")

    if not ubootconfigflags:
        return

    ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
    if len(ubootconfig) > 0:
        for config in ubootconfig:
            for f, v in ubootconfigflags.items():
                if config == f:
                    items = v.split(',')
                    if items[0] and len(items) > 3:
                        raise bb.parse.SkipPackage('Only config,images,binary can be specified!')
                    # From u-boot-ti.inc, the last config is the default
                    # So keep overwriting UBOOT_MACHINE to get to the default
                    d.setVar('UBOOT_MACHINE', items[0])
                    break
    elif len(ubootconfig) == 0:
       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
}
