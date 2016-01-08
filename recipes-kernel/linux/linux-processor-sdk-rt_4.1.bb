require linux-processor-sdk_4.1.bb

# Look in the generic major.minor directory for files
# This will have priority over generic non-rt path
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"

BRANCH = "processor-sdk-linux-rt-02.00.01"

SRCREV = "2046db6f15cd08d0075faa117facb5b7be9cc15f"
