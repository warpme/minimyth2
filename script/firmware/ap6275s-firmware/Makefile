
GARNAME      = ap6275s-firmware
# 7.02.2026
GARVERSION   = f065f271d492193a472a12103a0604ef4178a5c7
CATEGORIES   = firmware
MASTER_SITES = https://github.com/armbian/firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac43752-sdio.bin      $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-sdio.bin
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac43752-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-sdio.clm_blob
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac43752-sdio.txt      $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275s.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-sdio.bin      $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-sdio.khadas,vim4.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-sdio.khadas,vim4.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275s.txt           $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-sdio.khadas,vim4.txt
	@cp -Rdf $(WORKSRC)/ap6275p/BCM4362A2.hcd                 $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.hcd $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.khadas,vim4.hcd
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-sdio*
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275s*
