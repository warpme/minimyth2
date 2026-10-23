
GARNAME      = bootfiles-board-s905w2.tanix_w2
GARVERSION   = 2026-10-23
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \
               boot.config \
               board-s905w2.tanix_w2.config \

export SOC_TYPE                  = s4
export mm_U-BOOT_BOARD_TYPE      = board-s905w2.tanix_w2
export mm_U-BOOT_BOARD_DEFCONFIG = tanix-w2_defconfig
export FIP_BOARD                 = khadas-vim1s

include ../bootloader/install-board-bootloader-aml-vendor.mk
