DESCRIPTION = "This package contains ROS driver for mmWave TI sensor."
SECTION = "devel"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=6ee5d8ff5204a889d79a1ffd1812b3c1"

SRC_URI[base.md5sum] = "f48fe4a1e654f359382fc617667f33c0"
SRC_URI[base.sha256sum] = "72b424a1c7568b04f1b583ef46d7716c10f77a0d05f4e950ac6d70991427a073"
SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_0_0/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p2.zip;name=base;subdir=${P}"

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
}

FILES_${PN} += "${ros_libdir}/ti_mmwave_rospkg"

ROS_SPN = "ti_mmwave_rospkg"
