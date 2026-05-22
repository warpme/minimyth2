
GARNAME      = bootfiles-board-khadas.vim3
GARVERSION   = 2026-05-20
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

export SOC_TYPE                  = g12b
export mm_U-BOOT_BOARD_TYPE      = board-a311d.vim3
export mm_U-BOOT_BOARD_DEFCONFIG = khadas-vim3_defconfig
export FIP_BOARD                 = khadas-vim3

include ../bootloader/install-board-bootloader-aml.mk
