PR_append = ".tisdk4"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','615bae16bff8ec7ea5976e12062fe9844a876590','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"

