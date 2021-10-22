
GARNAME      = cairo
GARVERSION   = 1.17.4
CATEGORIES   = gtk
MASTER_SITES = https://gitlab.freedesktop.org/cairo/cairo/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c gtk/glib lib/fontconfig lib/freetype lib/libpng xorg/xorg


CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D tests="disabled" \
	-D gtk2-utils="disabled" \
	-D gl-backend="glesv2" \
	-D drm="enabled" \
	-D glesv2="enabled" \
	-D glesv3="enabled" \

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libcairo.la
	@rm -rf $(DESTDIR)$(libdir)/libcairo-gobject.la
	@rm -rf $(DESTDIR)$(libdir)/libcairo-script-interpreter.la
	@$(MAKECOOKIE)
