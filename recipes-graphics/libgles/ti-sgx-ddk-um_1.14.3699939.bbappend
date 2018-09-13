PR_append = ".tisdk7"

BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/rocko/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','9ad48144e89d48c7bf2db2a12795985e7a80e4fa','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
