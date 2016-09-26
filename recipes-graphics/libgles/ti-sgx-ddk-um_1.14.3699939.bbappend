PR_append = ".tisdk0"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','4cdbb6b192fc5cac53695faca3c3f8be16ca871d','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"

