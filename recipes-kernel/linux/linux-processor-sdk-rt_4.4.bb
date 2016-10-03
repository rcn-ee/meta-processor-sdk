require linux-processor-sdk_4.4.bb

# Look in the generic major.minor directory for files
# This will have priority over generic non-rt path
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"

BRANCH = "processor-sdk-linux-rt-03.01.00"

SRCREV = "f572d285f0be2fa277a01f9d542e56b760c35363"
