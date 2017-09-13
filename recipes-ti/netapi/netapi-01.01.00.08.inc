PV = "01.01.00.08"

# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.08"
NETAPI_SRCREV = "50026020384737d253668c4be80745a3653106f8"

FILESEXTRAPATHS_prepend := "${THISDIR}/netapi:"
SRC_URI_append = " file://0001-replace-nl-xfrm-library-by-nl-xfrm-3.patch;pnum=4"
