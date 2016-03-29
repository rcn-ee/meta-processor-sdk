require linux-processor-sdk_4.1.bb

# Look in the generic major.minor directory for files
# This will have priority over generic non-rt path
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

BRANCH = "processor-sdk-linux-rt-02.00.02"

SRCREV = "8f9ed3d730641b5e0f00e1b42c7c74cee2a28ab9"
