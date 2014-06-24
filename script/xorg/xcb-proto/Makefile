GARNAME = xcb-proto
GARVERSION = 1.8
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://xcb.freedesktop.org/dist/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

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

post-install:
	@sed -i 's%^xcbincludedir=%xcbincludedir=$(DESTDIR)%g' $(DESTDIR)$(libdir)/pkgconfig/xcb-proto.pc
	@sed -i 's%^pythondir=%pythondir=$(DESTDIR)%g'         $(DESTDIR)$(libdir)/pkgconfig/xcb-proto.pc
	@$(MAKECOOKIE)
