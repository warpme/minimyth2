GARNAME      = brcmfmac_sdio-firmware
GARVERSION   = 1665cb888eb3623517df391af09ca9ac7ae237f8
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
	@$(MAKECOOKIE)

clean-all:
	@true
