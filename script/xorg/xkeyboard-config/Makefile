
GARNAME       = xkeyboard-config
GARVERSION    = 2.38
CATEGORIES    = $(CATEGORY)
MASTER_SITES  = https://xorg.freedesktop.org/archive/individual/data/$(GARNAME)/
DISTFILES     = $(DISTNAME).tar.xz
LICENSE       = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/xorgproto
BUILDDEPS = \
	perl/perl-XML-Parser \
	$(CATEGORY)/xkbcomp

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@mv $(DESTDIR)$(datadir)/pkgconfig/xkeyboard-config.pc $(DESTDIR)$(libdir)/pkgconfig/xkeyboard-config.pc
	@$(MAKECOOKIE)
