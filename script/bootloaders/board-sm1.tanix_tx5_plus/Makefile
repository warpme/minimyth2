
GARNAME      = bootfiles-board-sm1.tanix_tx5_plus
GARVERSION   = 2026-05-29
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

export SOC_TYPE                  = sm1
export mm_U-BOOT_BOARD_TYPE      = board-sm1.tanix_tx5_plus
export mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx5plus_defconfig
export FIP_BOARD                 = tanix-tx5plus

include ../bootloader/install-board-bootloader-aml.mk
