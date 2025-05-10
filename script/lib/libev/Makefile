
GARNAME      = libev
GARVERSION   = 4.33
CATEGORIES   = lib
MASTER_SITES = http://dist.schmorp.de/libev/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = BSD

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libev.la
	@$(MAKECOOKIE)
