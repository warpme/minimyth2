GARNAME = bootloader
CATEGORIES = $(CATEGORY)
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	$(if $(filter board-rpi2,$(mm_BOARD_TYPE)), \
		$(CATEGORY)/board-rpi2) \
	$(if $(filter board-rpi3,$(mm_BOARD_TYPE)), \
		$(CATEGORY)/board-rpi3) \
	$(if $(filter board-tx3-mini,$(mm_BOARD_TYPE)), \
		$(CATEGORY)/board-tx3-mini) \

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

include ../../gar.mk

clean-all:
	@$(foreach dir, $(wildcard ../u-boot ../board-*), $(MAKE) clean clean-all -C $(dir) ; )
	@$(MAKE) clean
