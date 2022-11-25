
GARNAME      = xcb-proto
GARVERSION   = 1.15.2
CATEGORIES   = $(CATEGORY)
MASTER_SITES = http://xcb.freedesktop.org/dist/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@mv $(DESTDIR)$(datadir)/pkgconfig/xcb-proto.pc $(DESTDIR)$(libdir)/pkgconfig/xcb-proto.pc
	@$(MAKECOOKIE)
