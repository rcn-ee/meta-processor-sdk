require linux-processor-sdk_4.1.bb

# Look in the generic major.minor directory for files
# This will have priority over generic non-rt path
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

BRANCH = "processor-sdk-linux-rt-02.00.02"

SRCREV = "cacaccccecaf27b9b7292c2b5fa072cb421b3cbc"
