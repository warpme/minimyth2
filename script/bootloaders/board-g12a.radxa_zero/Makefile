
GARNAME      = bootfiles-board-radxa.zero
GARVERSION   = 2026-05-20
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

export SOC_TYPE                  = g12a
export mm_U-BOOT_BOARD_TYPE      = board-g12a.radxa_zero
export mm_U-BOOT_BOARD_DEFCONFIG = radxa-zero_defconfig
export FIP_BOARD                 = radxa-zero

include ../bootloader/install-board-bootloader-aml.mk
