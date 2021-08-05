
GARNAME      = libbsd
GARVERSION   = 0.10.0
CATEGORIES   = lib
MASTER_SITES = https://libbsd.freedesktop.org/releases/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz

LICENSE = LGPL2

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
	@rm -f $(DESTDIR)$(libdir)/libbsd.la
	@$(MAKECOOKIE)


