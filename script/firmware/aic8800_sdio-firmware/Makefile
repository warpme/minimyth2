
GARNAME      = aic8800_sdio-firmware
# 24.05.2024 v2024_0116
# GARVERSION   = 4396dd6cc6db566b638272d875ae2a98f43836e0
# 24.06.14 v3.0_2024_0327_3561b08f
GARVERSION   = 55d82dd8c78861cf034a22cc29ebdd21d93b7349
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
