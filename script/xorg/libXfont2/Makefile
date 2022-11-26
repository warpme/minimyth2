
GARNAME      = libXfont2
GARVERSION   = 2.0.6
CATEGORIES   = $(CATEGORY)
MASTER_SITES = $(XORG_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/freetype devel/zlib \
	$(CATEGORY)/xorgproto \
	$(CATEGORY)/libfontenc \
	$(CATEGORY)/util-macros \
	$(CATEGORY)/xtrans

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-devel-docs \
	--enable-freetype \
	--enable-builtins \
	--enable-builtins \
	--enable-pcfformat \
	--disable-bdfformat \
	--disable-snfformat \
	--enable-fc \
	--enable-unix-transport \
	--disable-tcp-transport \
	--disable-ipv6 \
	--disable-local-transport \
	--with-gnu-ld

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
