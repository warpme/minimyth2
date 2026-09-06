
GARNAME      = bootfiles-board-s912.beelink_gt1
GARVERSION   = 2026-09-06
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

export SOC_TYPE                  = s912
export mm_U-BOOT_BOARD_TYPE      = board-s912.beelink_gt1
export mm_U-BOOT_BOARD_DEFCONFIG = beelink-gt1_defconfig
# it looks my gt1 needs p212 fip. with beelink_gt1 it fails at dram init...
export FIP_BOARD                 = p212

include ../bootloader/install-board-bootloader-aml.mk
