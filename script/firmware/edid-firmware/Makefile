
GARNAME      = edid-firmware
GARVERSION   = 1.0
CATEGORIES   = firmware
MASTER_SITES = 
DISTFILES    = s2-tek.bin

LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC=$(WORKDIR)

DEPENDS = 

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/edid
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/edid/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/edid*
