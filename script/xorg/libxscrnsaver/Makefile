GARNAME = libXScrnSaver
GARVERSION = 1.2.2
CATEGORIES = lib
MASTER_SITES = http://xorg.freedesktop.org/releases/individual/lib/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/libXext xorg/xorgproto

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libXss.a
	@rm -f $(DESTDIR)$(libdir)/libXss.la
	@$(MAKECOOKIE)
