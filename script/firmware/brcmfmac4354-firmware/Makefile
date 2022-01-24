
GARNAME      = armbian-firmware
GARVERSION   = 20211228
CATEGORIES   = firmware
MASTER_SITES = http://sources.buildroot.net/armbian-firmware/git/rkwifi/
DISTFILES    = fw_bcm4354a1_ag.bin nvram_ap6354.txt
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/brcm
	@cp -Rdf $(WORKSRC)/fw_bcm4354a1_ag.bin $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -Rdf $(WORKSRC)/nvram_ap6354.txt    $(DESTDIR)$(elibdir)/firmware/brcm/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/fw_bcm4354a1_ag.bin $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4354-sdio.pine64,quartz64-a.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6354.txt    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4354-sdio.pine64,quartz64-a.txt
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/fw_bcm4354a1_ag.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6354.txt
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4354-sdio.pine64,quartz64-a.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4354-sdio.pine64,quartz64-a.txt
