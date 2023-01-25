
GARNAME       = brcmfmac4354-firmware-txt
GARVERSION    = 20210315-3
CATEGORIES    = firmware
MASTER_SITES  = http://sources.buildroot.net/armbian-firmware/git/rkwifi/
MASTER_SITES += http://ftp.de.debian.org/debian/pool/non-free/f/firmware-nonfree/
DISTFILES     = firmware-brcm80211_$(GARVERSION)_all.deb nvram_ap6354.txt
LICENSE       =
DESCRIPTION   =
define BLURB
endef

DEPENDS = 

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/brcm
	@cp -Rdf $(WORKDIR)/nvram_ap6354.txt                                         $(DESTDIR)$(elibdir)/firmware/brcm/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6354.txt           $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4354-sdio.amediatech,x96-x6.txt
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4354*.txt
