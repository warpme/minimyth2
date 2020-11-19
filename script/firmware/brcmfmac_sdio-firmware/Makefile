GARNAME      = brcmfmac_sdio-firmware
# Git master from 21.09.2020
GARVERSION   = 4b4acd5f91fcf3c8190a08b74e1afd2274080860
CATEGORIES   = firmware
MASTER_SITES = https://github.com/LibreELEC/brcmfmac_sdio-firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/brcmfmac_sdio-firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -f $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,rockpi4.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,rockpi4b.txt
	@cp -f $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt               $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt
	@$(MAKECOOKIE)

clean-all:
	@true
