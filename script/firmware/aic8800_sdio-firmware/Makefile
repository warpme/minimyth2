
GARNAME      = aic8800_sdio-firmware
#v0.2.19 with aic8800 v2024_0116
GARVERSION   = 624200cd90e78b253d79c51f0189ddb20efbe315
CATEGORIES   = firmware
MASTER_SITES = https://github.com/radxa-pkg/radxa-firmware/archive/
DISTFILES    = $(GARVERSION).zip

LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/radxa-firmware-$(GARVERSION)/firmware/aic8800D80

DEPENDS = 

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/aic8800_sdio
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/aic8800_sdio/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/aic8800_sdio
