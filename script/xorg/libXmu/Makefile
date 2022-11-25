GARNAME = libXmu
GARVERSION = 1.1.1
CATEGORIES = $(CATEGORY)
MASTER_SITES = $(XORG_MASTER_SITES)
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libXext \
	$(CATEGORY)/libXt \
	$(CATEGORY)/util-macros \
	$(CATEGORY)/xorgproto

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-docs \
	--enable-shared \
	--disable-static \
	--enable-unix-transport \
	--disable-tcp-transport \
	--disable-ipv6 \
	--disable-local-transport \
	--with-gnu-ld \
	--without-lint

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/libXmuu.la
	@$(MAKECOOKIE)
