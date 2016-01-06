require linux-processor-sdk_4.1.bb

# Look in the generic major.minor directory for files
# This will have priority over generic non-rt path
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

BRANCH = "processor-sdk-linux-rt-02.00.01"

SRCREV = "4cbb33b5c4454d9af61e32dd812e0db64fbdcb29"
