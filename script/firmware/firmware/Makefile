
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
	firmware/brcmfmac43430-firmware-txt \
	firmware/brcmfmac43455-firmware-txt \
	firmware/brcmfmac4354-firmware-txt  \
	firmware/brcmfmac4359-firmware  \
	firmware/brcmfmac6330-firmware  \
	firmware/brcmfmac6334-firmware  \
	firmware/rpi-bluez-firmware     \
	firmware/aw859a-firmware        \
	$(if $(filter meson, $(mm_GRAPHICS)),firmware/amlogic-meson-firmware) \
	$(if $(filter nouveau, $(mm_GRAPHICS)),firmware/nouveau-firmware) \

include ../../gar.mk

clean-all:
	@$(foreach dir, $(wildcard ../*-firmware*), $(MAKE) clean clean-all -C $(dir) ; )
	@$(MAKE) clean
	@$(MAKE) clean-all -C ../wireless-regdb

