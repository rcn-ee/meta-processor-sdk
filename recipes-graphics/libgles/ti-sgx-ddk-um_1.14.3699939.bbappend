PR_append = ".tisdk8"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/rocko/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bc62c9d0c590dfbc801bf6b10176c3a8b6a39d98','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
