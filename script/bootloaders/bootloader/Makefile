GARNAME = bootloader
CATEGORIES = $(CATEGORY)
LICENSE =

DESCRIPTION = 
define BLURB
endef

INSTALL_SCRIPTS = custom

include ../../gar.mk

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

install-custom:
ifneq (,$(findstring board-rpi2,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../u-boot
	$(MAKE) install -C ../board-rpi2
endif

ifneq (,$(findstring board-rpi3,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../u-boot
	$(MAKE) install -C ../board-rpi3
endif

ifneq (,$(findstring board-s905,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../u-boot
	$(MAKE) install -C ../board-s905
endif

ifneq (,$(findstring board-s912,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../u-boot
	$(MAKE) install -C ../board-s912
endif

ifneq (,$(findstring board-rk3328,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../u-boot
	$(MAKE) install -C ../board-rk3328
endif

ifneq (,$(findstring board-rk3399,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../u-boot
	$(MAKE) install -C ../board-rk3399
endif

ifneq (,$(findstring board-h6.beelink_gs1,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../arm-trusted-firmware
	$(MAKE) clean -C ../u-boot-sunxi
	$(MAKE) install -C ../board-h6.beelink_gs1
endif

ifneq (,$(findstring board-h6.eachlink_mini,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../arm-trusted-firmware
	$(MAKE) clean -C ../u-boot-sunxi
	$(MAKE) install -C ../board-h6.eachlink_mini
endif

ifneq (,$(findstring board-h6.tanix_tx6,$(mm_BOARD_TYPE)))
	$(MAKE) clean -C ../arm-trusted-firmware
	$(MAKE) clean -C ../u-boot-sunxi
	$(MAKE) install -C ../board-h6.tanix_tx6
endif

clean-all:
	@$(foreach dir, $(wildcard ../u-boot /u-boot-sunxi ../board-* ../arm-trusted-firmware), $(MAKE) clean clean-all -C $(dir) ; )
	$(MAKE) clean
