

GARNAME      = brcmfmac_sdio-openwrt-firmware
GARVERSION   = 5.4.18-2020_0402
CATEGORIES   = firmware
MASTER_SITES = https://community.cypress.com/gfawx74859/attachments/gfawx74859/resourcelibrary/1016/1/
DISTFILES    = cypress-fmac-v$(GARVERSION).zip
LICENSE      =
DESCRIPTION  =

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@tar -xf $(WORKDIR)/cypress-firmware-v$(GARVERSION).tar.gz -C $(WORKSRC)
	@cp -Rdf $(WORKSRC)/firmware/* $(DESTDIR)$(elibdir)/firmware/brcm/
	@$(MAKECOOKIE)

clean-all:
	@true
