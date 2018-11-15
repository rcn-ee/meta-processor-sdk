DESCRIPTION = "This package contains mmwave autonomous robotics demos"
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://docs/Autonomous_Robotics_with_ROS_for_mmWave_manifest.pdf;md5=d0fe8e43974f93eb11715ab1a9f58bea"
SRC_URI[base.md5sum] = "eb8af8e629c365004a6eb4f70464ddc3"
SRC_URI[base.sha256sum] = "95553c507f27bd8f68eb6a5f4d5cfa4bb3784b9d61f02d21f7c61a86d8186a1f"
SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_3_1_0/labs/lab0008-autonomous-robotics-ros/lab0008_autonomous_robotics_ros/ti_mmwave_ros_map_nav_v1p2.tar.gz;name=base;subdir=${P}"

SRC_URI += "file://0001-turtlebot-bringup-description-launch-xml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
            file://0002-turtlebot-bringup-minimal-launch.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
            file://0001-turtlebot-navigation-params-yaml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation \
            file://0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch;patchdir=${S} \
            file://0003-turtlebot-bringup-description.launch \
"

S = "${WORKDIR}/${P}/turtlebot_mmwave_launchers"

PR = "r0"

inherit catkin

RDEPENDS_${PN} += "bash"

do_install_append() {
    install -d ${D}${ros_datadir}/turtlebot_mmwave_launchers
    cp -r ${S}/launch ${D}${ros_datadir}/turtlebot_mmwave_launchers
    cp -r ${S}/scripts ${D}${ros_datadir}/turtlebot_mmwave_launchers

    install -d ${D}${ros_datadir}/ti_mmwave_rospkg
    cp -r ${WORKDIR}/${P}/ti_mmwave_rospkg/cfg ${D}${ros_datadir}/ti_mmwave_rospkg

    install -d ${D}${ros_datadir}/turtlebot_bringup
    install -d ${D}${ros_datadir}/turtlebot_description
    cp -r ${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup/* ${D}${ros_datadir}/turtlebot_bringup
    cp -r ${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_description/* ${D}${ros_datadir}/turtlebot_description 
    cp ${WORKDIR}/0003-turtlebot-bringup-description.launch ${D}${ros_datadir}/turtlebot_bringup/launch/description.launch
    rm -rf ${D}${ros_datadir}/turtlebot_bringup/patches

    install -d ${D}${ros_datadir}/turtlebot_navigation
    cp -r ${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation/* ${D}${ros_datadir}/turtlebot_navigation
    rm -rf ${D}${ros_datadir}/turtlebot_navigation/patches
}

FILES_${PN} += "${ros_datadir}/turtlebot_mmwave_launchers"
FILES_${PN} += "${ros_datadir}/ti_mmwave_rospkg"
FILES_${PN} += "${ros_datadir}/turtlebot_bringup"
FILES_${PN} += "${ros_datadir}/turtlebot_description"
FILES_${PN} += "${ros_datadir}/turtlebot_navigation"

ROS_SPN = "turtlebot_mmwave_launchers"
