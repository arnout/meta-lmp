FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

include recipes-bsp/u-boot/u-boot-lmp-common.inc

# From the 08.06.00.004 dunfell tag
SRCREV = "072a9b409c15bfd1e0de99b2b0e7c06f850a32df"

SRC_URI:append = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'jailhouse', 'file://0003-HACK-lib-lmb-Allow-re-reserving-post-relocation-U-Bo.patch', '', d)} \
"

SRC_URI:append:am64xx-evm = " \
    file://fw_env.config \
    file://lmp.cfg \
"

SRC_URI:append:am62xx-evm = " \
    file://0001-am62xx-evm-set-bootm-len-to-64M.patch \
    file://fw_env.config \
    file://lmp.cfg \
"

PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/tee-pager_v2.bin.signed,,optee-os-fio"
