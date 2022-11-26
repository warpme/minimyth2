
GARNAME      = xcb-util-wm
GARVERSION   = 0.4.2
CATEGORIES   = $(CATEGORY)
MASTER_SITES = $(XORG_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = MIT

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

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxcb-keysyms.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-ewmh.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-icccm.la
	@$(MAKECOOKIE)
