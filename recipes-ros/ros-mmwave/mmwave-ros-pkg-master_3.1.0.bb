DESCRIPTION = "This package contains ROS driver for mmWave TI sensor."
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=1f2c3f56972fee1e60c320f371c34595"
SRC_URI[base.md5sum] = "822e5f91acbcfc2b68ba2d440ec9be82"
SRC_URI[base.sha256sum] = "d4c8d7c204972656096d458938c19d6b3277ef435bbdbb735076d9597d7a880c"
SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_3_1_0/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p5.zip;name=base;subdir=${P}"
SRC_URI += "file://0001-ti-mmwave-rospkg-launch-rviz.patch \
            file://setup.bash \
"

PR = "r2"

# do not use rpath
EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"

DEPENDS = "message-generation rosserial-embeddedlinux serial-ros nodelet roscpp rosconsole roscpp-serialization rostime std-msgs pcl-ros"

S = "${WORKDIR}/${P}/ti_mmwave_rospkg"

inherit catkin

do_install_append() {
     install -d  ${D}${ros_libdir}/ti_mmwave_rospkg
     cp ${WORKDIR}/devel/lib/libmmwave.so ${D}${ros_libdir}
     cp ${WORKDIR}/devel/lib/ti_mmwave_rospkg/* ${D}${ros_libdir}/ti_mmwave_rospkg/
     cp ${S}/mmWave_nodelets.xml ${D}${ros_datadir}/ti_mmwave_rospkg/
     cp -r ${S}/cfg ${D}${ros_datadir}/ti_mmwave_rospkg/
     cp -r ${S}/launch ${D}${ros_datadir}/ti_mmwave_rospkg/
     cp ${WORKDIR}/setup.bash ${D}${ros_prefix}
}

FILES_${PN} += "${ros_libdir}/ti_mmwave_rospkg"
FILES_${PN} += "${ros_prefix}/setup.bash"

ROS_SPN = "ti_mmwave_rospkg"
