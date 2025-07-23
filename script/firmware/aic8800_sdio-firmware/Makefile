
GARNAME      = aic8800_sdio-firmware
# 22.07.2025 v2025_0410_b99ca8b6
GARVERSION   = dd2afa18bc47dfde591ee981b57bd7b22d017a0d
CATEGORIES   = firmware
MASTER_SITES = https://github.com/radxa-pkg/aic8800/archive/
DISTFILES    = $(GARVERSION).zip

LICENSE      =
DESCRIPTION  =
define BLURB
endef


WORKSRC = $(WORKDIR)/aic8800-$(GARVERSION)/src/SDIO/driver_fw/fw/aic8800D80

DEPENDS = 

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/aic8800_sdio
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/aic8800_sdio/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/aic8800_sdio
