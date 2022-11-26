
GARNAME      = libXcomposite
GARVERSION   = 0.4.5
CATEGORIES   = $(CATEGORY)
MASTER_SITES = $(XORG_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c xorg/util-macros xorg/libXfixes

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libXcomposite.a
	@rm -f $(DESTDIR)$(libdir)/libXcomposite.la
	@$(MAKECOOKIE)
