require linux-processor-sdk_4.1.bb

# Look in the generic major.minor directory for files
# This will have priority over generic non-rt path
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

BRANCH = "processor-sdk-linux-rt-02.00.02"

SRCREV = "4415f52a1e1ee3c0e86b5053c2471f6aa625f9af"
