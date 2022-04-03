
GARNAME    = firmware
CATEGORIES = firmware
LICENSE    =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	firmware/alsa-sof-firmware      \
	firmware/linux-firmware         \
	firmware/wireless-regdb         \
	firmware/xr819-firmware         \
	firmware/qca9377-firmware       \
	firmware/brcmfmac43456-firmware \
	firmware/brcmfmac43430-firmware \
	firmware/brcmfmac43455-firmware \
	firmware/brcmfmac4354-firmware  \
	firmware/brcmfmac4359-firmware  \
	firmware/brcmfmac6330-firmware  \
	firmware/bluez-firmware-rpi     \
	firmware/linux-firmware-meson   \

include ../../gar.mk

clean-all:
	@$(foreach dir, $(wildcard ../linux-*), $(MAKE) clean     -C $(dir) ; )
	@$(foreach dir, $(wildcard ../linux-*), $(MAKE) clean-all -C $(dir) ; )
	@$(MAKE) clean
	@$(MAKE) clean-all -C ../alsa-sof-firmware
	@$(MAKE) clean-all -C ../wireless-regdb
	@$(MAKE) clean-all -C ../xr819-firmware
	@$(MAKE) clean-all -C ../qca9377-firmware
	@$(MAKE) clean-all -C ../brcmfmac43456-firmware
	@$(MAKE) clean-all -C ../brcmfmac43430-firmware
	@$(MAKE) clean-all -C ../brcmfmac43455-firmware
	@$(MAKE) clean-all -C ../brcmfmac4354-firmware
	@$(MAKE) clean-all -C ../brcmfmac4359-firmware
	@$(MAKE) clean-all -C ../brcmfmac6330-firmware
	@$(MAKE) clean-all -C ../bluez-firmware-rpi
	@$(MAKE) clean-all -C ../linux-firmware-meson
