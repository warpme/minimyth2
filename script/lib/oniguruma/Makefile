
GARNAME      = oniguruma
GARVERSION   = 6.9.6
CATEGORIES   = lib
MASTER_SITES = https://github.com/kkos/oniguruma/releases/download/v$(GARVERSION)/
DISTFILES    = onig-$(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/onig-$(GARVERSION)
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libonig.la
	@$(MAKECOOKIE)
