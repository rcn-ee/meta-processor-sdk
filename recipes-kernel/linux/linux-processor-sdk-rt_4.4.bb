require linux-processor-sdk_4.4.bb

# Look in the generic major.minor directory for files
# This will have priority over generic non-rt path
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"

BRANCH = "processor-sdk-linux-rt-03.00.00"

SRCREV = "94da3e7b69ba44e936a0e08a9d425f79a8a2070a"
