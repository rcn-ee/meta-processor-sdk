# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.08"
EMAC_LLD_SRCREV = "20b30c9dd37ae1f899e93b560dce41f804e43317"

PV = "01.00.03.08"
PR = "r0"

# Build with make instead of XDC
TI_PDK_XDCMAKE = "0"

export PDK_EMAC_ROOT_PATH ="${WORKDIR}/build"
export DEST_ROOT="${S}"
