DESCRIPTION = "This package contains mmwave autonomous robotics demos"
SECTION = "devel"
LICENSE = "BSD"

LIC_FILES_CHKSUM = "file://docs/Autonomous_Robotics_with_ROS_for_mmWave_manifest.pdf;md5=052cbb2cc0847a82abb159996f974c35"
SRC_URI[base.md5sum] = "561921297c73a7ead40bf7486ee8f4f9"
SRC_URI[base.sha256sum] = "768661b88bd31f083660287045dc49a9441d15cf10b0c48e7d29377a23864191"
SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_5_1/labs/lab0008-autonomous-robotics-ros/lab0008_autonomous_robotics_ros/ti_mmwave_ros_map_nav_v1p1.gz;name=base;subdir=${P}"

SRC_URI += "file://0001-turtlebot-bringup-description-launch-xml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
            file://0002-turtlebot-bringup-minimal-launch.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
            file://0001-turtlebot-navigation-costmap-params-yaml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation \
            file://0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch;patchdir=${S} \
"

S = "${WORKDIR}/${P}/turtlebot_mmwave_launchers"

PR = "r1"

inherit catkin

RDEPENDS_${PN} += "bash"

tar_xf() {
    tar xf ${WORKDIR}/ti_mmwave_ros_map_nav_v1p1 -C ${WORKDIR}/${P}
}

do_unpack[postfuncs] += "tar_xf"

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
