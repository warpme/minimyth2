
GARNAME      = bootfiles-board-s905w.tx3-mini
GARVERSION   = 2026-09-08
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

export SOC_TYPE                  = s905
export mm_U-BOOT_BOARD_TYPE      = board-s905w.tx3-mini
export mm_U-BOOT_BOARD_DEFCONFIG = tanix-tx3mini_defconfig
export FIP_BOARD                 = tanix-tx3-mini

include ../bootloader/install-board-bootloader-aml.mk
