GARNAME = SDL-Test
GARVERSION =
CATEGORIES = emulators
MASTER_SITES = http://vba.ngemu.com/downloads/
DISTFILES = Makefile $(GARNAME).cpp
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/SDL

BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

extract-Makefile:
	@mkdir -p $(WORKSRC)
	@cp $(DOWNLOADDIR)/Makefile $(WORKSRC)/
	@$(MAKECOOKIE)

extract-$(GARNAME).cpp:
	@mkdir -p $(WORKSRC)
	@cp $(DOWNLOADDIR)/$(GARNAME).cpp $(WORKSRC)/
	@$(MAKECOOKIE)
