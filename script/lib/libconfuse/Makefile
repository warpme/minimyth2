
GARNAME      = confuse
GARVERSION   = 3.3
CATEGORIES   = lib
MASTER_SITES = https://github.com/libconfuse/libconfuse/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libconfuse.la
