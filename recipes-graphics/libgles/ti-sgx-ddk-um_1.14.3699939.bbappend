PR_append = ".tisdk1"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','3c0537748dd283b2de9c5369570aa2aade5a9979','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"

