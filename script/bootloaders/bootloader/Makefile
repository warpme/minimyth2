
# make clean: clean only this packahe
# make clean-all: cleans ALL packages in bootloaders
# make clean-bootloader: cleans only bootloadr-related files in main/boot
# For refresh bootloader after changing board run:
# 1. make bootloaders/clean-bootloader
# 2. make bootloaders/install

GARNAME = bootloader
CATEGORIES = $(CATEGORY)
LICENSE =

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = utils/kickstart-oe

INSTALL_SCRIPTS = custom

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

ifneq (,$(findstring board-s905,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-s905
endif

ifneq (,$(findstring board-s912,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-s912
endif

ifneq (,$(findstring board-g12,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-g12
endif

ifneq (,$(findstring board-sm1,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-sm1
endif

ifneq (,$(findstring board-rk3328.beelink_a1,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3328.beelink_a1
endif

ifneq (,$(findstring board-rk3399.rockpi4-b,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-rk3399.rockpi4-b
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

ifneq (,$(findstring board-x86pc.bios,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.bios
endif

ifneq (,$(findstring board-x86pc.efi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.efi64
endif

ifneq (,$(findstring board-x86pc.bios_efi64,$(mm_BOARD_TYPE)))
	$(MAKE) install -C ../board-x86pc.bios_efi64
endif

	@cp -f $(mm_HOME)/html/minimyth/conf/minimyth.conf $(DESTDIR)/boot/

clean-all:
	@$(foreach dir, $(wildcard ../u-boot ../u-boot-* ../board-* ../arm-trusted-firmware*), $(MAKE) clean clean-all -C $(dir) ; )
	$(MAKE) clean

clean-bootloader:
	@$(foreach dir, $(wildcard ../board-* ), $(MAKE) clean-all -C $(dir) ; )
	@rm -f $(DESTDIR)/boot/minimyth.conf
	$(MAKE) clean
