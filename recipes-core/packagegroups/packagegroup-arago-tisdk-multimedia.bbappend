PR_append = ".tisdk0"

ACCEL_FW_append_am57xx-evm = " \
    ${@base_contains('MACHINE_FEATURES', 'mmip', 'dspdce-fw', '', d)} \
    "

ACCEL_FW_append_omap5-evm = " \
    ${@base_contains('MACHINE_FEATURES', 'mmip', 'dspdce-fw', '', d)} \
    "

ACCEL_FW_append_dra7xx-evm = " \
    ${@base_contains('MACHINE_FEATURES', 'mmip', 'dspdce-fw', '', d)} \
    "
