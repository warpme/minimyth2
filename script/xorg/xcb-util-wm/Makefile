GARNAME = xcb-util-wm
GARVERSION = 0.4.1
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://xcb.freedesktop.org/dist/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/libxcb \
	$(CATEGORY)/xorgproto

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--enable-selective-werror \
	--enable-silent-rules \
	--with-gnu-ld

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxcb-keysyms.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-ewmh.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-icccm.la
	@$(MAKECOOKIE)
