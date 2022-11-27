
GARNAME      = libX11
GARVERSION   = 1.8.2
CATEGORIES   = $(CATEGORY)
MASTER_SITES = $(XORG_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c \
	$(CATEGORY)/xorgproto \
	$(CATEGORY)/libxcb \
	$(CATEGORY)/util-macros \
	$(CATEGORY)/xtrans

BUILDDEPS = \
	$(CATEGORY)/xorg-sgml-doctools

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-unix-transport \
	--disable-tcp-transport \
	--disable-ipv6 \
	--disable-local-transport \
	--disable-secure-rpc \
	--disable-loadable-i18n \
	--enable-loadable-xcursor \
	--enable-xthreads \
	--disable-xcms \
	--enable-xlocale \
	--disable-xlocaledir \
	--enable-xf86bigfont \
	--enable-xkb \
	--disable-composecache \
	--disable-lint-library \
	--enable-malloc0returnsnull \
	--without-xmlto \
	--without-fop \
	--with-gnu-ld \
	--without-launchd \
	--without-lint \
	--with-keysymdefdir=$(DESTDIR)$(includedir)/X11 \

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)-xcb.la
	@$(MAKECOOKIE)
