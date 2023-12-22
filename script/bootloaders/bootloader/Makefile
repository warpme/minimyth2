
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
ifneq (,$(findstring _board-rpi2_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rpi2
endif

ifneq (,$(findstring _board-rpi3.mainline64_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rpi3.mainline64
endif

ifneq (,$(findstring _board-rpi3.mainline32_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rpi3.mainline32
endif

ifneq (,$(findstring _board-rpi3.rpi32_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rpi3.rpi32
endif

ifneq (,$(findstring _board-rpi4.mainline64_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rpi4.mainline64
endif

ifneq (,$(findstring _board-rpi34.mainline64_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rpi34.mainline64
endif

ifneq (,$(findstring _board-rpi4.rpi32_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rpi4.rpi32
endif

ifneq (,$(findstring _board-rpi4.rpi64_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rpi4.rpi64
endif

ifneq (,$(findstring _board-s905_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-s905
endif

ifneq (,$(findstring _board-s912_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-s912
endif

ifneq (,$(findstring _board-g12.radxa_zero_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-g12.radxa_zero
endif

ifneq (,$(findstring _board-sm1.x96_air2g_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-sm1.x96_air2g
endif

ifneq (,$(findstring _board-sm1.tanix_tx5_plus_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-sm1.tanix_tx5_plus
endif

ifneq (,$(findstring _board-rk3328.beelink_a1_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3328.beelink_a1
endif

ifneq (,$(findstring _board-rk3399.rockpi4-b_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3399.rockpi4-b
endif

ifneq (,$(findstring _board-rk3399.rockpi4-se_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3399.rockpi4-se
endif

ifneq (,$(findstring _board-rk3399.orangepi_4_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3399.orangepi_4
endif

ifneq (,$(findstring _board-rk3399.orangepi_4_lts_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3399.orangepi_4_lts
endif

ifneq (,$(findstring _board-rk3528.vontar_r3_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3528.vontar_r3
endif

ifneq (,$(findstring _board-rk3566.x96_x6_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3566.x96_x6
endif

ifneq (,$(findstring _board-rk3566.quartz64-b_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3566.quartz64-b
endif

ifneq (,$(findstring _board-rk3566.urve-pi_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3566.urve-pi
endif

ifneq (,$(findstring _board-rk3568.rock3-a_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3568.rock3-a
endif

ifneq (,$(findstring _board-rk3568.rock3-b_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3568.rock3-b
endif

ifneq (,$(findstring _board-rk3566.rock3-c_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3566.rock3-c
endif

ifneq (,$(findstring _board-rk3566.orangepi_3b_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3566.orangepi_3b
endif

ifneq (,$(findstring _board-rk3588.rock5-b_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3588.rock5-b
endif

ifneq (,$(findstring _board-rk3588s.orangepi_5_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3588s.orangepi_5
endif

ifneq (,$(findstring _board-rk3588s.rock5-a_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3588s.rock5-a
endif

ifneq (,$(findstring _board-rk3588.orangepi_5_plus_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-rk3588.orangepi_5_plus
endif

ifneq (,$(findstring _board-h6.beelink_gs1_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h6.beelink_gs1
endif

ifneq (,$(findstring _board-h6.eachlink_mini_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h6.eachlink_mini
endif

ifneq (,$(findstring _board-h6.tanix_tx6_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h6.tanix_tx6
endif

ifneq (,$(findstring _board-h6.orangepi_3_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h6.orangepi_3
endif

ifneq (,$(findstring _board-h6.orangepi_3_lts_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h6.orangepi_3_lts
endif

ifneq (,$(findstring _board-h6.tanix_tx6_mini_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h6.tanix_tx6_mini
endif

ifneq (,$(findstring _board-h616.tanix_tx6s_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h616.tanix_tx6s
endif

ifneq (,$(findstring _board-h616.tanix_tx6s_lpddr3_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h616.tanix_tx6s_lpddr3
endif

ifneq (,$(findstring _board-h616.tanix_tx6s_axp313_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h616.tanix_tx6s_axp313
endif

ifneq (,$(findstring _board-h616.t95_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h616.t95
endif

ifneq (,$(findstring _board-h616.x96_mate_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h616.x96_mate
endif

ifneq (,$(findstring _board-h616.orangepi_zero2_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h616.orangepi_zero2
endif

ifneq (,$(findstring _board-h616.pendoo_x12pro_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h616.pendoo_x12pro
endif

ifneq (,$(findstring _board-h618.orangepi_zero3_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h618.orangepi_zero3
endif

ifneq (,$(findstring _board-h618.orangepi_zero2w_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h618.orangepi_zero2w
endif

ifneq (,$(findstring _board-h618.vontar_h618_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h618.vontar_h618
endif

ifneq (,$(findstring _board-h313.x96_q_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h313.x96_q
endif

ifneq (,$(findstring _board-h313.x96_q_lpddr3_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h313.x96_q_lpddr3
endif

ifneq (,$(findstring _board-h313.x96_q_lpddr3_v1.3_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-h313.x96_q_lpddr3_v1.3
endif

ifneq (,$(findstring _board-x86pc.bios_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-x86pc.bios
endif

ifneq (,$(findstring _board-x86pc.efi64_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-x86pc.efi64
endif

ifneq (,$(findstring _board-x86pc.bios_efi64_,_$(mm_BOARD_TYPE)_))
	$(MAKE) install -C ../board-x86pc.bios_efi64
endif

clean-custom: clean-bootloader cookieclean

clean-bootloader: cookieclean
	@$(foreach dir, $(wildcard ../board-* ), $(MAKE) clean -C $(dir) ; )
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all:
	@$(foreach dir, $(wildcard ../u-boot ../u-boot-* ../board-* ../arm-trusted-firmware* ../crust), $(MAKE) clean clean-all -C $(dir) ; )
