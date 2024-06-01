
GARNAME      = jansson
GARVERSION   = 2.14
CATEGORIES   = lib
MASTER_SITES = https://github.com/akheron/jansson/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = MIT

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libjansson.la
	@$(MAKECOOKIE)
