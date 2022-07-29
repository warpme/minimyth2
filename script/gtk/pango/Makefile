
GARNAME      = pango
GARVERSION   = 1.50.8
CATEGORIES   = gtk
MASTER_SITES = http://ftp.gnome.org/pub/GNOME/sources/pango/1.50/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lang/cxx gtk/cairo gtk/glib gtk/harfbuzz lib/freetype lib/fontconfig xorg/xorg

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D gtk_doc="false" \
	-D install-tests="false" \

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libpango-1.0.la
	@rm -rf $(DESTDIR)$(libdir)/libpangocairo-1.0.la
	@rm -rf $(DESTDIR)$(libdir)/libpangoft2-1.0.la
	@rm -rf $(DESTDIR)$(libdir)/libpangoxft-1.0.la
	@rm -rf $(DESTDIR)$(libdir)/pango/1.8.0/modules/pango-arabic-lang.la
	@rm -rf $(DESTDIR)$(libdir)/pango/1.8.0/modules/pango-basic-fc.la
	@rm -rf $(DESTDIR)$(libdir)/pango/1.8.0/modules/pango-indic-lang.la
	@$(MAKECOOKIE)
