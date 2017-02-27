PR_append = ".tisdk3"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','d184140aa5c17e13e1bf21151f1a7bc068bdf8bf','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"

