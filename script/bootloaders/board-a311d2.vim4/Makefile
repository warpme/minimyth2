
GARNAME      = bootfiles-board-khadas.vim4
GARVERSION   = 2026-05-20
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

export SOC_TYPE                  = t7
export mm_U-BOOT_BOARD_TYPE      = board-a311d2.vim4
export mm_U-BOOT_BOARD_DEFCONFIG = khadas-vim4_defconfig
export FIP_BOARD                 = khadas-vim4

include ../bootloader/install-board-bootloader-aml.mk
