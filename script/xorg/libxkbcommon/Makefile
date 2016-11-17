GARNAME = libxkbcommon
GARVERSION = 0.6.1
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://xkbcommon.org/download/
DISTFILES = $(DISTNAME).tar.xz
# LICENSE = $(GARNAME)
# $(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxkbcommon.a
	@rm -f $(DESTDIR)$(libdir)/libxkbcommon.la
	@rm -f $(DESTDIR)$(libdir)/libxkbcommon-x11.a
	@rm -f $(DESTDIR)$(libdir)/libxkbcommon-x11.la
	@$(MAKECOOKIE)
