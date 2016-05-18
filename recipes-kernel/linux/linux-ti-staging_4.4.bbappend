PR_append = ".tisdk4"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-ARM-dts-keystone-evm-add-DT-bindings-for-debugss-and.patch \
    file://0002-ti_config_fragments-connectivity-enable-usb-serial-o.patch \
    file://0003-soc-ti-qmss-fix-error-in-shared-access-of-QMSS-INTD-.patch \
    file://0004-ARM-dts-keystone-use-syscon-regmap-to-enable-shared-.patch \
    file://0005-soc-ti-fix-error-in-set_words-helper.patch \
    file://0006-lib-ktree-add-generic-tree-implementation.patch \
    file://0007-soc-ti-qmss-unmap-descriptors-without-knowing-descri.patch \
    file://0008-net-netcp-support-of-multiple-subqueues-per-interfac.patch \
    file://0009-soc-ti-qmss-add-support-of-queue-range-specific-push.patch \
    file://0010-soc-ti-saving-qmss-clock-in-driver-storage.patch \
    file://0011-ARM-dts-keystone-add-qmss-clock-name.patch \
    file://0012-soc-qmss-support-of-loading-different-types-of-firmw.patch \
    file://0013-soc-ti-add-support-of-loading-qos-firmware.patch \
    file://0014-soc-ti-add-support-of-Quality-of-Service-PDSP.patch \
    file://0015-net-netcp-Add-Keystone-NetCP-QoS-driver.patch \
    file://0016-ARM-dts-keystone-add-qos-support.patch \
    file://0017-ti_config_fragments-connectivity.cfg-Enable-QoS-on-K.patch \
    file://0018-soc-ti-qos-fix-error-in-misspelled-string-when-parsi.patch \
    file://0019-net-netcp-cpts-introduce-keystone-netcp-cpts-softwar.patch \
    file://0020-net-netcp-cpts-update-to-64bit-for-4.4.y.patch \
    file://0021-net-netcp-add-support-of-cpts.patch \
    file://0022-ARM-keystone-dts-add-gbe-and-10gbe-netcp-cpts-bindin.patch \
    file://0023-ti_config_fragments-connectivity.cfg-enable-keystone.patch \
    file://0024-net-netcp-cpts-disable-cpts-time-stamping-using-DT-p.patch \
"
