require linux-processor-sdk_4.4.bb

# Look in the generic major.minor directory for files
# This will have priority over generic non-rt path
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"

BRANCH = "processor-sdk-linux-rt-03.00.00"

SRCREV = "c08949504e06d9eebf0351300242503d437e94b6"
