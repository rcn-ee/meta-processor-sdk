PR_append = ".tisdk2"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','6019bf95ee30a65db6b27ea48e6ee65e8b16e0a6','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"

