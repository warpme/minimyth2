
GARNAME      = jzintv
GARVERSION   = 20181225
CATEGORIES   = emulators
MASTER_SITES = http://spatula-city.org/~im14u2c/intv/dl/
PATCHFILES   = $(DISTNAME)-src-fix-compilation.patch
DISTFILES    = $(DISTNAME)-src.zip
LICENSE      = GPL2

WORKSRC = $(WORKDIR)/$(DISTNAME)-src

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/SDL

BUILD_SCRIPTS   = $(WORKSRC)/src/Makefile
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -f $(WORKSRC)/bin/jzintv $(DESTDIR)$(bindir)/jzintv
	@$(MAKECOOKIE)
