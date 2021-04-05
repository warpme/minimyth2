
GARNAME      = brcmfmac43456-firmware
# Git master from 25.01.2021
GARVERSION   = master
CATEGORIES   = firmware
MASTER_SITES = https://github.com/RPi-Distro/firmware-nonfree/archive/refs/heads/
DISTFILES    = 	$(GARVERSION).zip \
		brcmfmac43456-sdio.radxa,rockpi4.txt \
		brcmfmac43456-sdio.pine64,rockpro64-v2.1.txt \
		brcmfmac43456-sdio.xunlong,orangepi-3.txt \

LICENSE      =
DESCRIPTION  =
WORKSRC = $(WORKDIR)/firmware-nonfree-$(GARVERSION)

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac43456* $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -f   $(WORKDIR)/brcmfmac43456-sdio.radxa,rockpi4.txt         $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,rockpi4b.txt
	@cp -f   $(WORKDIR)/brcmfmac43456-sdio.pine64,rockpro64-v2.1.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.pine64,rockpro64-v2.1.txt
	@cp -f   $(WORKDIR)/brcmfmac43456-sdio.xunlong,orangepi-3.txt    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.xunlong,orangepi-3.txt
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456*
