#===============================================================================
# BOM Configuration file
#
# Syntax:
#   Select one of available providers (recipes) for a package.
#   Usually used for virtual/xyz style packages. i.e virtual/kernel
#       PREFERRED_PROVIDER_<pkg> = "recipe"
#       PREFERRED_PROVIDER_<pkg>-<mach> = "recipe"
#   i.e.
#       PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
#       PREFERRED_PROVIDER_virtual/kenrel_omap3evm = "linux-omap3"
#
#   Select one of the available versions for a package
#       PREFERRED_VERSION_<pkg> = "X.Y.Z"
#       PREFERRED_VERSION_<pkg>-<mach> = "X.Y.Z"
#   i.e.
#       PREFERRED_VERSION_udev = "141"
#       PREFERRED_VERSION_udev:omap3evm = "124"
#
#   Enable source ipk creation for a package
#       CREATE_SRCIPK:pn-<pkg> = "1"
#   i.e.
#       CREATE_SRCIPK:pn-u-boot = "1"
#
#   Change install diretory of source ipk for a package
#       SRCIPK_INSTALL_DIR:pn-<pkg> = "<install dir>"
#   i.e.
#       SRCIPK_INSTALL_DIR:pn-u-boot = "board-support/u-boot-source"
#
#   Change source ipk architecture for a package
#       SRCIPK_PACKAGE_ARCH:pn-<pkg> = "<arch>"
#   i.e.
#       SRCIPK_PACKAGE_ARCH:pn-u-boot = "${MACHINE_ARCH}"
#===============================================================================

# Enable the creation of source ipks
INHERIT += "sourceipk"

# Disable including README and recipe files in sourceipks for SDK builds.
SRCIPK_INCLUDE_EXTRAFILES = "0"

# Set source ipk packages and install directories
CREATE_SRCIPK:pn-matrix-gui ?= "1"
SRCIPK_INSTALL_DIR:pn-matrix-gui ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-ti-crypto-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-crypto-examples ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-qml-carinfo ?= "1"
SRCIPK_INSTALL_DIR:pn-qml-carinfo ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-quick-playground ?= "1"
SRCIPK_INSTALL_DIR:pn-quick-playground ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-qt-catalog ?= "1"
SRCIPK_INSTALL_DIR:pn-qt-catalog ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-qt-patientcare ?= "1"
SRCIPK_INSTALL_DIR:pn-qt-patientcare ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-dual-camera-demo ?= "1"
SRCIPK_INSTALL_DIR:pn-dual-camera-demo ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-evse-hmi ?= "1"
SRCIPK_INSTALL_DIR:pn-evse-hmi ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-protection-relays-hmi ?= "1"
SRCIPK_INSTALL_DIR:pn-protection-relays-hmi ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-mmwavegesture-hmi ?= "1"
SRCIPK_INSTALL_DIR:pn-mmwavegesture-hmi ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-pdm-anomaly-detection ?= "1"
SRCIPK_INSTALL_DIR:pn-pdm-anomaly-detection ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-tiovx-app-host ?= "1"
SRCIPK_INSTALL_DIR:pn-tiovx-app-host ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-image-gallery ?= "1"
SRCIPK_INSTALL_DIR:pn-image-gallery ?= "example-applications/${PN}"

CREATE_SRCIPK:pn-am-sysinfo ?= "1"
SRCIPK_INSTALL_DIR:pn-am-sysinfo ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-oprofile-example ?= "1"
SRCIPK_INSTALL_DIR:pn-oprofile-example ?= "example-applications/${PN}"

CREATE_SRCIPK:pn-arm-benchmarks ?= "1"
SRCIPK_INSTALL_DIR:pn-arm-benchmarks ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-ti-pru-sw-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-pru-sw-examples ?= "example-applications/pru-${PV}"

CREATE_SRCIPK:pn-ti-ocf-crypto-module ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-ocf-crypto-module ?= "board-support/extra-drivers/${PN}-${PV}"

CREATE_SRCIPK:pn-av-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-av-examples ?= "example-applications/av-examples-${PV}"

CREATE_SRCIPK:pn-u-boot ?= "1"
SRCIPK_INSTALL_DIR:pn-u-boot ?= "board-support/u-boot-${PV}"

CREATE_SRCIPK:pn-u-boot-ti-staging ?= "1"
SRCIPK_INSTALL_DIR:pn-u-boot-ti-staging ?= "board-support/u-boot-${PV}${UBOOT_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-u-boot-ti-staging ?= "true"

CREATE_SRCIPK:pn-trusted-firmware-a ?= "1"
SRCIPK_INSTALL_DIR:pn-trusted-firmware-a ?= "board-support/${PN}-${PV}"
SRCIPK_PRESERVE_GIT:pn-trusted-firmware-a ?= "true"

CREATE_SRCIPK:pn-linux-ti-staging ?= "1"
SRCIPK_INSTALL_DIR:pn-linux-ti-staging ?= "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-linux-ti-staging ?= "true"
SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging ?= "true"

CREATE_SRCIPK:pn-linux-ti-staging-rt ?= "1"
SRCIPK_INSTALL_DIR:pn-linux-ti-staging-rt ?= "board-support/linux-rt-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-linux-ti-staging-rt ?= "true"
SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging-rt ?= "true"

CREATE_SRCIPK:pn-linux-ti-staging-systest ?= "1"
SRCIPK_INSTALL_DIR:pn-linux-ti-staging-systest ?= "board-support/linux-systest-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-linux-ti-staging-systest ?= "true"
SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging-systest ?= "true"

CREATE_SRCIPK:pn-sitara-linux-ti-staging ?= "1"
SRCIPK_INSTALL_DIR:pn-sitara-linux-ti-staging ?= "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-sitara-linux-ti-staging ?= "true"
SRCIPK_SHALLOW_CLONE:pn-sitara-linux-ti-staging ?= "true"
SRCIPK_SHALLOW_DEPTH:pn-sitara-linux-ti-staging ?= "400"

CREATE_SRCIPK:pn-linux-am335x-psp ?= "1"
SRCIPK_INSTALL_DIR:pn-linux-am335x-psp ?= "board-support/linux-${KVER}"

CREATE_SRCIPK:pn-linux ?= "1"
SRCIPK_INSTALL_DIR:pn-linux ?= "board-support/linux-${PV}"

CREATE_SRCIPK:pn-cryptodev-module ?= "1"
SRCIPK_INSTALL_DIR:pn-cryptodev-module ?= "board-support/extra-drivers/cryptodev-module-${PV}"
SRCIPK_PRESERVE_GIT:pn-cryptodev-module ?= "true"

CREATE_SRCIPK:pn-cmem-mod ?= "1"
SRCIPK_INSTALL_DIR:pn-cmem-mod ?= "board-support/extra-drivers/${PN}-${PV}"

CREATE_SRCIPK:pn-debugss-module-drv ?= "1"
SRCIPK_INSTALL_DIR:pn-debugss-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"

CREATE_SRCIPK:pn-gdbserverproxy-module-drv ?= "1"
SRCIPK_INSTALL_DIR:pn-gdbserverproxy-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"

CREATE_SRCIPK:pn-ti-sgx-ddk-km ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-sgx-ddk-km ?= "board-support/extra-drivers/${PN}-${PV}"

CREATE_SRCIPK:pn-ti-img-rogue-driver ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-img-rogue-driver ?= "board-support/extra-drivers/${PN}-${PV}"
SRCIPK_PRESERVE_GIT:pn-ti-img-rogue-driver ?= "true"

CREATE_SRCIPK:pn-ti-linux-driver-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-linux-driver-examples ?= "example-applications/linux-driver-examples-${PV}"

CREATE_SRCIPK:pn-ti-framework-components ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-framework-components ?= "component-sources/framework_components_${PV}"

CREATE_SRCIPK:pn-ti-codec-engine ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-codec-engine ?= "component-sources/codec_engine_${PV}"

CREATE_SRCIPK:pn-ti-linuxutils ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-linuxutils ?= "component-sources/linuxutils_${PV}"

CREATE_SRCIPK:pn-ti-xdctools ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-xdctools ?= "component-sources/xdctools_${PV}"

CREATE_SRCIPK:pn-ti-xdais ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-xdais ?= "component-sources/xdais_${PV}"

CREATE_SRCIPK:pn-ti-local-power-manager ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-local-power-manager ?= "local-power-manager_${PV}"

CREATE_SRCIPK:pn-ti-dvsdk-demos ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-dvsdk-demos ?= "dvsdk-demos_${PV}"

CREATE_SRCIPK:pn-ti-dvtb ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-dvtb ?= "dvtb_${PV}"

CREATE_SRCIPK:pn-ti-sysbios ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-sysbios ?= "component-sources/bios_${PV}"

CREATE_SRCIPK:pn-ti-biosutils ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-biosutils ?= "biosutils_${PV}"

CREATE_SRCIPK:pn-ti-dsplink ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-dsplink ?= "dsplink_${PV}"

CREATE_SRCIPK:pn-ti-syslink ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-syslink ?= "component-sources/syslink_${PV}"

CREATE_SRCIPK:pn-ti-audio-soc-example ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-audio-soc-example ?= "audio-soc-example_${PV}"

CREATE_SRCIPK:pn-ti-dsp-benchmark ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-dsp-benchmark ?= "example-applications/dsp-benchmark_${PV}"

CREATE_SRCIPK:pn-gstreamer-ti ?= "1"
SRCIPK_INSTALL_DIR:pn-gstreamer-ti ?= "gstreamer-ti_${PV}"

CREATE_SRCIPK:pn-ti-omx ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-omx ?= "component-sources/omx_${PV}"

CREATE_SRCIPK:pn-ti-uia ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-uia ?= "component-sources/uia_${PV}"

CREATE_SRCIPK:pn-ti-media-controller-utils ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-media-controller-utils ?= "board-support/media-controller-utils_${PV}"

CREATE_SRCIPK:pn-ti-slog ?= "1"
SRCIPK_INSTALL_DIR:pn-ti-slog ?= "component-sources/slog_${PV}"

CREATE_SRCIPK:pn-oe-layersetup ?= "1"
SRCIPK_INSTALL_DIR:pn-oe-layersetup ?= "bin/oe-layersetup"

CREATE_SRCIPK:pn-opencl-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-opencl-examples ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-openmpacc-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-openmpacc-examples ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-tidl-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-tidl-examples ?= "example-applications/${PN}-${PV}"
SRCIPK_SRC_DIR:pn-tidl-examples ?= "${S}/examples"

CREATE_SRCIPK:pn-qt-opencv-opencl-opengl-multithreaded ?= "1"
SRCIPK_INSTALL_DIR:pn-qt-opencv-opencl-opengl-multithreaded ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-libarch-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-libarch-examples ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-linalg-examples ?= "1"
SRCIPK_INSTALL_DIR:pn-linalg-examples ?= "example-applications/${PN}-${PV}"
SRCIPK_SRC_DIR:pn-linalg-examples ?= "${EXAMPLES_ROOT}"

CREATE_SRCIPK:pn-barcode-roi ?= "1"
SRCIPK_INSTALL_DIR:pn-barcode-roi ?= "example-applications/${PN}-${PV}"

CREATE_SRCIPK:pn-boot-monitor ?= "1"
SRCIPK_INSTALL_DIR:pn-boot-monitor ?= "board-support/${PN}-${PV}"

CREATE_SRCIPK:pn-hplib-mod ?= "1"
SRCIPK_INSTALL_DIR:pn-hplib-mod ?= "board-support/extra-drivers/${PN}-${PV}"

CREATE_SRCIPK:pn-uio-module-drv ?= "1"
SRCIPK_INSTALL_DIR:pn-uio-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"

CREATE_SRCIPK:pn-ipsecmgr-mod ?= "1"
SRCIPK_INSTALL_DIR:pn-ipsecmgr-mod ?= "board-support/extra-drivers/${PN}-${PV}"

CREATE_SRCIPK:pn-pru-icss ?= "1"
SRCIPK_INSTALL_DIR:pn-pru-icss ?= "example-applications/${PN}-${PV}"

# To create newlines in the message \n is used and the slash must be escaped
# to function properly

SRCIPK_GIT_COMMIT_MESSAGE = "\
Create local branch\\n\
\\n\
The below commit is used for this local branch and is the one used by\\n\
this sdk:\\n\
${SRCREV}."

SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE ="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
To reduce the size of the SDK installer only a portion of the git commit\\n\
history has been preserved. Also links to remote branches and tags do\\n\
not exist in this copy of the repository.\\n\
To fix this please run the unshallow-repositories.sh\\n\
script located in the sdk\'s bin directory\\n\
\\n\
The script may take several minutes but you will then have a full copy of\\n\
the git repository including its entire git history.\\n"

CREATE_SRCIPK:pn-linux-processor-sdk = "1"
SRCIPK_INSTALL_DIR:pn-linux-processor-sdk = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-linux-processor-sdk = "true"
SRCIPK_CUSTOM_GIT_BRANCH:pn-linux-processor-sdk = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE:pn-linux-processor-sdk = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
SRCIPK_SHALLOW_CLONE:pn-linux-processor-sdk = "true"
SRCIPK_SHALLOW_DEPTH:pn-linux-processor-sdk = "1"

CREATE_SRCIPK:pn-linux-processor-sdk-rt = "1"
SRCIPK_INSTALL_DIR:pn-linux-processor-sdk-rt = "board-support/linux-rt-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-linux-processor-sdk-rt = "true"
SRCIPK_CUSTOM_GIT_BRANCH:pn-linux-processor-sdk-rt = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE:pn-linux-processor-sdk-rt = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
SRCIPK_SHALLOW_CLONE:pn-linux-processor-sdk-rt = "true"
SRCIPK_SHALLOW_DEPTH:pn-linux-processor-sdk-rt = "1"

SRCIPK_CUSTOM_GIT_BRANCH:pn-linux-ti-staging = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE:pn-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging = "true"
SRCIPK_SHALLOW_DEPTH:pn-linux-ti-staging = "1"

CREATE_SRCIPK:pn-linux-ti-staging-rt = "1"
SRCIPK_INSTALL_DIR:pn-linux-ti-staging-rt = "board-support/linux-rt-${PV}${KERNEL_LOCALVERSION}"
SRCIPK_PRESERVE_GIT:pn-linux-ti-staging-rt = "true"
SRCIPK_CUSTOM_GIT_BRANCH:pn-linux-ti-staging-rt = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE:pn-linux-ti-staging-rt = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging-rt = "true"
SRCIPK_SHALLOW_DEPTH:pn-linux-ti-staging-rt = "1"

SRCIPK_CUSTOM_GIT_BRANCH:pn-u-boot-ti-staging = "processor-sdk-local"
SRCIPK_CUSTOM_GIT_MESSAGE:pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
