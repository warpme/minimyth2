
GARNAME      = bootfiles-board-s912.beelink_gt1_ultimate
GARVERSION   = 2026-10-02
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

export SOC_TYPE                  = s912
export mm_U-BOOT_BOARD_TYPE      = board-s912.beelink_gt1_ultimate
export mm_U-BOOT_BOARD_DEFCONFIG = beelink-gt1_defconfig
export FIP_BOARD                 = beelink-gt1

include ../bootloader/install-board-bootloader-aml.mk
