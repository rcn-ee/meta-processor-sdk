SUMMARY = "Open Source DL/ML runtime Modules"
DESCRIPTION = "Open Source DL/ML runtime Modules like TF-LITE and ONNX Runtime, NEO-AI-DLR. Supports both Python and CPP APIs"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

S = "${WORKDIR}/src"
PR = "r1"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
LICENSE = "MIT"



SRC_URI = "https://software-dl.ti.com/jacinto7/esd/tidl-tools/08_06_00_00/OSRT_TOOLS/ARM_LINUX/ARAGO/dlr-1.10.0-py3-none-any.whl;name=dlr;subdir=${S}/dlr\
           https://software-dl.ti.com/jacinto7/esd/tidl-tools/08_06_00_00/OSRT_TOOLS/ARM_LINUX/ARAGO/tflite_runtime-2.8.2-cp38-cp38-linux_aarch64.whl;name=tflite;subdir=${S}/tflite\
           https://software-dl.ti.com/jacinto7/esd/tidl-tools/08_06_00_00/OSRT_TOOLS/ARM_LINUX/ARAGO/onnxruntime_tidl-1.7.0-cp38-cp38-linux_aarch64.whl;name=ort;subdir=${S}/ort\
           https://software-dl.ti.com/jacinto7/esd/tidl-tools/08_06_00_00/OSRT_TOOLS/ARM_LINUX/ARAGO/tflite_2.8_aragoj7.tar.gz;name=tfl_lib;subdir=${S}/tfl_lib\
           https://software-dl.ti.com/jacinto7/esd/tidl-tools/08_06_00_00/OSRT_TOOLS/ARM_LINUX/ARAGO/onnx_1.7.0_aragoj7.tar.gz;name=ort_lib;subdir=${S}/ort_lib\
           https://software-dl.ti.com/jacinto7/esd/tidl-tools/08_06_00_00/OSRT_TOOLS/ARM_LINUX/ARAGO/opencv_4.2.0_aragoj7.tar.gz;name=opencv;subdir=${S}/opencv\
"
SRC_URI[dlr.sha256sum] = "64a6bda601119e754327401e8a3cff112a09923529fc0d1cba86c054c810fc5c"
SRC_URI[tflite.sha256sum] = "1e42f3788a46c99c59c2218054591a005055a9a71918d81362ff304de625fa7a"
SRC_URI[ort.sha256sum] = "096bc4de623f5515e08b5c0840f50a371fadcb195c1e8dd3b2939d535f454828"
SRC_URI[tfl_lib.sha256sum] = "f954709a5b1ca71e16220b697c3a6f457571d486ac05b00bb3d3e9ae85c422a5"
SRC_URI[ort_lib.sha256sum] = "c313ea2d0e2632b34c8d0b06e73710c72fbda555f3802cf0f3705bb034950bfb"
SRC_URI[opencv.sha256sum] = "4122073c37e3dd268fa814b6a53510325a1e6636aa3aea9d02ab79f42b4355bd"

do_cp_downloaded_build_deps() {
    mv ${S}/tfl_lib/*/* ${S}/tfl_lib
    mv ${S}/ort_lib/*/* ${S}/ort_lib
    mv ${S}/opencv/*/* ${S}/opencv
}
addtask cp_downloaded_build_deps after do_unpack before do_patch




PLAT_SOC = ""
PLAT_SOC_j7-evm = "j721e"
PLAT_SOC_j7-hs-evm = "j721e"
PLAT_SOC_j721s2-evm = "j721s2"
PLAT_SOC_j721s2-hs-evm = "j721s2"
PLAT_SOC_j784s4-evm = "j784s4"
PLAT_SOC_j784s4-hs-evm = "j784s4"
PLAT_SOC_am62axx-evm = "am62a"

DEPENDS += "python3-pip-native"

COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx-evm"

export SOC = "${PLAT_SOC}"
export TARGET_FS = "${WORKDIR}/recipe-sysroot"


PY_DST_DIR="${D}${libdir}/python3.8/site-packages"
LIB_DST_DIR="${D}${libdir}"

FILES_${PN}-staticdev += "${libdir}/tflite_2.8/*.a"
FILES_${PN}-staticdev += "${libdir}/tflite_2.8/pthreadpool/*.a"
FILES_${PN}-staticdev += "${libdir}/tflite_2.8/farmhash-build/*.a"
FILES_${PN}-staticdev += "${libdir}/tflite_2.8/xnnpack-build/*.a"
FILES_${PN}-staticdev += "${libdir}/tflite_2.8/fft2d-build/*.a"
FILES_${PN}-staticdev += "${libdir}/tflite_2.8/clog-build/*.a"
FILES_${PN}-staticdev += "${libdir}/tflite_2.8/cpuinfo-build/*.a"
FILES_${PN}-staticdev += "${libdir}/tflite_2.8/ruy-build/*.a"
FILES_${PN}-staticdev += "${libdir}/tflite_2.8/flatbuffers-build/*.a"
FILES_${PN}-staticdev += "${libdir}/*.a"
FILES_${PN} += "${libdir}/*.so*"
FILES_${PN} += "${libdir}/python3.8/*"
FILES_${PN} += "${includedir}"


do_install() {
pip3 install  --no-deps --platform linux_aarch64 ${S}/tflite/tflite_runtime-2.8.2-cp38-cp38-linux_aarch64.whl --target ${PY_DST_DIR} --disable-pip-version-check    
pip3 install  --no-deps --platform linux_aarch64 ${S}/dlr/dlr-1.10.0-py3-none-any.whl  --target ${PY_DST_DIR} --disable-pip-version-check    
pip3 install  --no-deps --platform linux_aarch64 ${S}/ort/onnxruntime_tidl-1.7.0-cp38-cp38-linux_aarch64.whl  --target ${PY_DST_DIR} --disable-pip-version-check    

cp -r ${S}/tfl_lib/tensorflow  ${D}${includedir}/
cp -r ${S}/tfl_lib/tflite_2.8  ${LIB_DST_DIR}/
cp ${S}/tfl_lib/libtensorflow-lite.a ${LIB_DST_DIR}/

cp   ${S}/ort_lib/libonnxruntime.so  ${LIB_DST_DIR}/libonnxruntime.so.1.7.0
ln -s -r ${LIB_DST_DIR}/libonnxruntime.so.1.7.0 ${LIB_DST_DIR}/libonnxruntime.so
rm -rf  ${S}/ort_lib/onnxruntime/csharp
cp -r  ${S}/ort_lib/onnxruntime ${D}${includedir}/

cp -r ${S}/opencv/opencv-4.2.0  ${D}${includedir}/

}
