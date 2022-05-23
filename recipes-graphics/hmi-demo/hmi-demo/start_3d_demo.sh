#!/bin/sh

DEMO_3D_APP_NAME=/usr/bin/SGX/demos/Wayland/OpenGLESSkinning

# Get logical Width of the screen using weston-info
eval `weston-info | grep 'logical_width\|logical_height' | sed -e 's/.*logical_width: \(.*\), logical_height: \(.*\)/LOGICAL_WIDTH=\1/'`

# Get logical Height of the screen using weston-info
eval `weston-info | grep 'logical_width\|logical_height' | sed -e 's/.*logical_width: \(.*\), logical_height: \(.*\)/LOGICAL_HEIGHT=\2/'`

DEMO_3D_CMD="$DEMO_3D_APP_NAME -width=$LOGICAL_WIDTH -height=$LOGICAL_HEIGHT "

# Launch 3D Demo
eval $DEMO_3D_CMD

