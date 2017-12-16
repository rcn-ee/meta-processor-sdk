# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.08A"
EMAC_LLD_SRCREV = "20a21b3c25fcfebbc0450e88397a4be135ff703b"

PV = "01.00.03.08A"
PR = "r0"

# Build with make instead of XDC
TI_PDK_XDCMAKE = "0"

export PDK_EMAC_ROOT_PATH ="${WORKDIR}/build"
export DEST_ROOT="${S}"
