
GARNAME      = aic8800-firmware
GARVERSION   = feaad69c35e0e95b15c0be79c3dfbeedb6075505
CATEGORIES   = firmware
MASTER_SITES = https://github.com/sipeed/LonganPi-3H-SDK/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/LonganPi-3H-SDK-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@rm -rf $(DESTDIR)$(elibdir)/firmware/aic8800*
	@cp -Rdf $(WORKSRC)/overlay/usr/lib/firmware/aic8800* $(DESTDIR)$(elibdir)/firmware/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/aic8800*
