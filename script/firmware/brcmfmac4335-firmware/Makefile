
GARNAME      = brcmfmac4335-firmware
GARVERSION   = 88e46425ef489513c0b8bf7c2747d262367be1cc
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
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4335-sdio.*
	@cp -Rdf $(WORKSRC)/brcmfmac4335-sdio.* $(DESTDIR)$(elibdir)/firmware/brcm/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4335-sdio.bin $(DESTDIR)$(elibdir)/firmware/brcm//brcmfmac4335-sdio.transpeed,8k618-t.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4335-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4335-sdio.transpeed,8k618-t.txt
	@# creating fake .clm_blob as i can't find real one. this allows to get wifi working...
	@touch $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4335-sdio.clm_blob
	@touch $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4335-sdio.transpeed,8k618-t.clm_blob
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4335*
