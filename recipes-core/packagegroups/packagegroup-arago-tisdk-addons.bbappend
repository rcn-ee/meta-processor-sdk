PR:append = ".psdk0"

EXTRA_PACKAGES:append:ti33x = " opencv"
EXTRA_PACKAGES:append:ti43x = " opencv"

EXTRA_PACKAGES:append:am335x-evm = " pru-adc"

EXTRA_PACKAGES:append:k3 = " watchdog"

EXTRA_PACKAGES:append = " hidapi"

EXTRA_PACKAGES:append:am64xx = " \
    benchmark-server \
    opcua-server \
    benchmark-demo-firmware \
    print-ip \
"

EXTRA_PACKAGES:append:am62xx = " \
    ti-apps-launcher \
"

UTILS:append = " net-snmp net-snmp-server-snmpd"

