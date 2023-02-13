
GARNAME      = brcmfmac43455-firmware-txt
# Git master from 23.06.2021
GARVERSION   = 00de3194a96397c913786945ac0af1fd6fbec45b
CATEGORIES   = firmware
MASTER_SITES = https://github.com/RPi-Distro/firmware-nonfree/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
WORKSRC = $(WORKDIR)/firmware-nonfree-$(GARVERSION)

define BLURB
endef

DEPENDS = lang/c firmware/linux-firmware

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac43455*.txt $(DESTDIR)$(elibdir)/firmware/brcm/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt            $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt            $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt            $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.radxa,rock3c.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.radxa,rockpi4b.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.radxa,rockpi4c.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.radxa,rockpi4se.txt
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455*.txt
