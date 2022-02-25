GARNAME      = armbian-firmware
GARVERSION   = 3a9902186c3d4e81747ca69528af150dcf82fe3c
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
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac-ap6330*           $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac4356-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330-sdio.txt   $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330-sdio.oranth,tanix-tx6-mini.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330-sdio.bin   $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330-sdio.oranth,tanix-tx6-mini.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330-sdio.txt   $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330-sdio.oranth,tanix-tx6.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330-sdio.bin   $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330-sdio.oranth,tanix-tx6.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac-ap6330*
