
# make clean: clean all boards bootloaders. Built U-boot, boot block binaries in main/lib/u-boot/* are NOT deleted
# make clean-all: cleans ALL packages in bootloaders and also DELETING built binaries in main/lib/u-boot/*
# make clean-bootloader: the same like clean
# For refresh bootloader after changing board run:
# 1. make bootloaders/clean
# 2. make bootloaders/install

GARNAME = bootloader
CATEGORIES = $(CATEGORY)
LICENSE =

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = utils/kickstart-oe

INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

install-custom:
ifneq (,$(filter board-rpi2,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi2
endif

ifneq (,$(filter board-rpi3.mainline64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi3.mainline64
endif

ifneq (,$(filter board-rpi3.mainline32,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi3.mainline32
endif

ifneq (,$(filter board-rpi3.rpi32,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi3.rpi32
endif

ifneq (,$(filter board-rpi4.mainline64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi4.mainline64
endif

ifneq (,$(filter board-rpi5.mainline64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi5.mainline64
endif

ifneq (,$(filter board-rpi34.mainline64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi34.mainline64
endif

ifneq (,$(filter board-rpi345.mainline64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi345.mainline64
endif

ifneq (,$(filter board-rpi4.rpi32,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi4.rpi32
endif

ifneq (,$(filter board-rpi4.rpi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi4.rpi64
endif

ifneq (,$(filter board-rpi5.rpi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi5.rpi64
endif

ifneq (,$(filter board-s905,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-s905
endif

ifneq (,$(filter board-s912,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-s912
endif

ifneq (,$(filter board-g12.radxa_zero,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-g12.radxa_zero
endif

ifneq (,$(filter board-sm1.x96_air2g,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-sm1.x96_air2g
endif

ifneq (,$(filter board-sm1.tanix_tx5_plus,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-sm1.tanix_tx5_plus
endif

ifneq (,$(filter board-rk3328.beelink_a1,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3328.beelink_a1
endif

ifneq (,$(filter board-rk3399.rockpi4-b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3399.rockpi4-b
endif

ifneq (,$(filter board-rk3399.rockpi4-se,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3399.rockpi4-se
endif

ifneq (,$(filter board-rk3399.orangepi_4,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3399.orangepi_4
endif

ifneq (,$(filter board-rk3399.orangepi_4_lts,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3399.orangepi_4_lts
endif

ifneq (,$(filter board-rk3528.vontar_r3,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3528.vontar_r3
endif

ifneq (,$(filter board-rk3528.rock2-a,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3528.rock2-a
endif

ifneq (,$(filter board-rk3566.x96_x6,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.x96_x6
endif

ifneq (,$(filter board-rk3566.zero3w,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.zero3w
endif

ifneq (,$(filter board-rk3566.zero3e,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.zero3e
endif

ifneq (,$(filter board-rk3566.quartz64-b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.quartz64-b
endif

ifneq (,$(filter board-rk3566.urve-pi,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.urve-pi
endif

ifneq (,$(filter board-rk3568.rock3-a,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3568.rock3-a
endif

ifneq (,$(filter board-rk3568.rock3-b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3568.rock3-b
endif

ifneq (,$(filter board-rk3566.rock3-c,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.rock3-c
endif

ifneq (,$(filter board-rk3566.orangepi_3b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.orangepi_3b
endif

ifneq (,$(filter board-rk3588.rock5-b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588.rock5-b
endif

ifneq (,$(filter board-rk3588.rock5-t,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588.rock5-t
endif

ifneq (,$(filter board-rk3588.rock5-itx,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588.rock5-itx
endif

ifneq (,$(filter board-rk3588s.orangepi_5,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588s.orangepi_5
endif

ifneq (,$(filter board-rk3588s.orangepi_5_pro,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588s.orangepi_5_pro
endif

ifneq (,$(filter board-rk3588s.orangepi_5,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588s.orangepi_5
endif

ifneq (,$(filter board-rk3588s.rock5-a,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588s.rock5-a
endif

ifneq (,$(filter board-rk3588s.rock5-c,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588s.rock5-c
endif

ifneq (,$(filter board-rk3588.orangepi_5_plus,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588.orangepi_5_plus
endif

ifneq (,$(filter board-rk3588s.nanopi_m6,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588s.nanopi_m6
endif

ifneq (,$(filter board-rk3588s.nanopi_r6s,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588s.nanopi_r6s
endif

ifneq (,$(filter board-rk3588.nanopc_t6,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588.nanopc_t6
endif

ifneq (,$(filter board-rk3588.nanopc_t6_lts,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3588.nanopc_t6_lts
endif

ifneq (,$(filter board-h6.beelink_gs1,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.beelink_gs1
endif

ifneq (,$(filter board-h6.eachlink_mini,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.eachlink_mini
endif

ifneq (,$(filter board-h6.tanix_tx6,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.tanix_tx6
endif

ifneq (,$(filter board-h6.orangepi_3,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.orangepi_3
endif

ifneq (,$(filter board-h6.orangepi_3_lts,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.orangepi_3_lts
endif

ifneq (,$(filter board-h6.tanix_tx6_mini,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.tanix_tx6_mini
endif

ifneq (,$(filter board-h616.tanix_tx6s,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.tanix_tx6s
endif

ifneq (,$(filter board-h616.tanix_tx6s_lpddr3,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.tanix_tx6s_lpddr3
endif

ifneq (,$(filter board-h616.tanix_tx6s_axp313,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.tanix_tx6s_axp313
endif

ifneq (,$(filter board-h616.t95,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.t95
endif

ifneq (,$(filter board-h616.x96_mate,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.x96_mate
endif

ifneq (,$(filter board-h616.orangepi_zero2,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.orangepi_zero2
endif

ifneq (,$(filter board-h616.pendoo_x12pro,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.pendoo_x12pro
endif

ifneq (,$(filter board-h618.orangepi_zero3,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h618.orangepi_zero3
endif

ifneq (,$(filter board-h618.orangepi_zero2w,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h618.orangepi_zero2w
endif

ifneq (,$(filter board-h728.x96q_pro_plus,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h728.x96q_pro_plus
endif

ifneq (,$(filter board-t527.orangepi_4a,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-t527.orangepi_4a
endif

ifneq (,$(filter board-a527.cubie_a5e,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-a527.cubie_a5e
endif

ifneq (,$(filter board-h618.vontar_h618,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h618.vontar_h618
endif

ifneq (,$(filter board-h313.x96_q,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h313.x96_q
endif

ifneq (,$(filter board-h313.x96_q_v5.1,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h313.x96_q_v5.1
endif

ifneq (,$(filter board-h313.x96_q_lpddr3,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h313.x96_q_lpddr3
endif

ifneq (,$(filter board-h313.x96_q_lpddr3_v1.3,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h313.x96_q_lpddr3_v1.3
endif

ifneq (,$(filter board-h313.tanix_tx1,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h313.tanix_tx1
endif

ifneq (,$(filter board-h313.tanix_tx1_v1.2,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h313.tanix_tx1_v1.2
endif

ifneq (,$(filter board-x86pc.bios,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.bios
endif

ifneq (,$(filter board-x86pc.efi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.efi64
endif

ifneq (,$(filter board-x86pc.bios_efi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.bios_efi64
endif

clean-custom: clean-bootloader cookieclean

clean-bootloader: cookieclean
	@$(foreach dir, $(wildcard ../board-* ), $(MAKE) clean -C $(dir) ; )
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all:
	@$(foreach dir, $(wildcard ../u-boot ../u-boot-* ../board-* ../arm-trusted-firmware* ../crust), $(MAKE) clean clean-all -C $(dir) ; )
