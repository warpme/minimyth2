GARNAME = firmware
CATEGORIES = firmware
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	firmware/alsa-sof-firmware \
	firmware/linux-firmware    \
	firmware/wireless-regdb    \

include ../../gar.mk

clean-all:
	@$(foreach dir, $(wildcard ../linux-*), $(MAKE) clean     -C $(dir) ; )
	@$(foreach dir, $(wildcard ../linux-*), $(MAKE) clean-all -C $(dir) ; )
	@$(MAKE) clean
	@$(MAKE) clean     -C ../alsa-sof-firmware
	@$(MAKE) clean     -C ../wireless-regdb
	@$(MAKE) clean-all -C ../alsa-sof-firmware
	@$(MAKE) clean-all -C ../wireless-regdb
