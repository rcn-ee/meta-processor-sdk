DESCRIPTION = "This package contains ROS driver for mmWave TI sensor."
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=2f41c03cb07673fdbb8bc449e1d179ae"
SRC_URI[base.md5sum] = "58594aee8e222ff7b259067ad7da0094"
SRC_URI[base.sha256sum] = "06a93099e85ef47ad70f96db86a0601ace59512d8cc5c5ea0609285c1497dca1"
SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_5_1/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p4.zip;name=base;subdir=${P}"
SRC_URI += "file://append_launch \
            file://append_cfg \
            file://setup.bash \
"

PR = "r0"

# do not use rpath
EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"

DEPENDS = "message-generation rosserial-embeddedlinux serial-ros nodelet roscpp rosconsole roscpp-serialization rostime std-msgs pcl-ros"

S = "${WORKDIR}/${P}/ti_mmwave_rospkg"

inherit catkin

do_install_append() {
     install -d  ${D}${ros_libdir}/ti_mmwave_rospkg
     cp ${WORKDIR}/build/devel/lib/libmmwave.so ${D}${ros_libdir}
     cp ${WORKDIR}/build/devel/lib/ti_mmwave_rospkg/* ${D}${ros_libdir}/ti_mmwave_rospkg/
     cp ${S}/mmWave_nodelets.xml ${D}${ros_datadir}/ti_mmwave_rospkg/
     cp -r ${S}/cfg ${D}${ros_datadir}/ti_mmwave_rospkg/
     cp -r ${S}/launch ${D}${ros_datadir}/ti_mmwave_rospkg/
     cp  ${WORKDIR}/append_launch/*.launch  ${D}${ros_datadir}/ti_mmwave_rospkg/launch/.
     cp  ${WORKDIR}/append_cfg/*.bt  ${D}${ros_datadir}/ti_mmwave_rospkg/cfg/.
     cp ${WORKDIR}/setup.bash ${D}${ros_prefix}
}

FILES_${PN} += "${ros_libdir}/ti_mmwave_rospkg"
FILES_${PN} += "${ros_prefix}/setup.bash"

ROS_SPN = "ti_mmwave_rospkg"
