
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
ifneq (,$(findstring board-rpi2,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi2
endif

ifneq (,$(findstring board-rpi3.mainline64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi3.mainline64
endif

ifneq (,$(findstring board-rpi3.mainline32,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi3.mainline32
endif

ifneq (,$(findstring board-rpi3.rpi32,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi3.rpi32
endif

ifneq (,$(findstring board-rpi4.mainline64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi4.mainline64
endif

ifneq (,$(findstring board-rpi34.mainline64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi34.mainline64
endif

ifneq (,$(findstring board-rpi4.rpi32,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi4.rpi32
endif

ifneq (,$(findstring board-rpi4.rpi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rpi4.rpi64
endif

ifneq (,$(findstring board-s905,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-s905
endif

ifneq (,$(findstring board-s912,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-s912
endif

ifneq (,$(findstring board-g12.radxa_zero,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-g12.radxa_zero
endif

ifneq (,$(findstring board-sm1.x96_air2g,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-sm1.x96_air2g
endif

ifneq (,$(findstring board-sm1.tanix_tx5_plus,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-sm1.tanix_tx5_plus
endif

ifneq (,$(findstring board-rk3328.beelink_a1,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3328.beelink_a1
endif

ifneq (,$(findstring board-rk3399.rockpi4-b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3399.rockpi4-b
endif

ifneq (,$(findstring board-rk3399.orangepi_4,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3399.orangepi_4
endif

ifneq (,$(findstring board-rk3566.x96_x6,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.x96_x6
endif

ifneq (,$(findstring board-rk3566.quartz64-b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3566.quartz64-b
endif

ifneq (,$(findstring board-rk3568.rock3-a,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3568.rock3-a
endif

ifneq (,$(findstring board-rk3568.rock3-b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3568.rock3-b
endif

ifneq (,$(findstring board-h6.beelink_gs1,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.beelink_gs1
endif

ifneq (,$(findstring board-h6.eachlink_mini,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.eachlink_mini
endif

ifneq (,$(findstring board-h6.tanix_tx6,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.tanix_tx6
endif

ifneq (,$(findstring board-h6.orangepi_3,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.orangepi_3
endif

ifneq (,$(findstring board-h6.tanix_tx6_mini,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h6.tanix_tx6_mini
endif

ifneq (,$(findstring board-h616.tanix_tx6s,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.tanix_tx6s
endif

ifneq (,$(findstring board-h616.t95,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.t95
endif

ifneq (,$(findstring board-h616.x96_mate,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.x96_mate
endif

ifneq (,$(findstring board-h616.orangepi_zero2,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-h616.orangepi_zero2
endif

ifneq (,$(findstring board-x86pc.bios,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.bios
endif

ifneq (,$(findstring board-x86pc.efi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.efi64
endif

ifneq (,$(findstring board-x86pc.bios_efi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.bios_efi64
endif

clean-custom: clean-bootloader cookieclean

clean-bootloader:
	@$(foreach dir, $(wildcard ../board-* ), $(MAKE) clean -C $(dir) ; )
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all:
	@$(foreach dir, $(wildcard ../u-boot ../u-boot-* ../board-* ../arm-trusted-firmware* ../crust), $(MAKE) clean clean-all -C $(dir) ; )
