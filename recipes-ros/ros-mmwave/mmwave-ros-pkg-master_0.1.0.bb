DESCRIPTION = "This package contains ROS driver for mmWave TI sensor."
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=da4f1cae75b0590538edcb7e23a325d8"
SRC_URI[base.md5sum] = "e85370690db8652d9d706aa77facce6a"
SRC_URI[base.sha256sum] = "1c88f501f5e9827299b8172d5895e54cb0178a65879f1d1092761cfe0e48bae4"
SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_1_1/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p2p1.zip;name=base;subdir=${P}"
SRC_URI += "file://append_launch"
SRC_URI += "file://append_cfg"

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
}

FILES_${PN} += "${ros_libdir}/ti_mmwave_rospkg"

ROS_SPN = "ti_mmwave_rospkg"
