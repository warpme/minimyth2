
GARNAME      = gdk-pixbuf
GARVERSION   = 2.42.2
CATEGORIES   = gtk
MASTER_SITES = http://ftp.gnome.org/pub/GNOME/sources/gdk-pixbuf/2.42/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS    = lang/c lang/cxx gtk/glib lib/libjpeg lib/libpng lib/libtiff xorg/xorg data/shared-mime-info
BUILDDEPS  = gtk/gtk-doc

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D gtk_doc="false" \
	-D docs="false" \
	-D introspection="disabled" \
	-D man="false" \
	-D installed_tests="false"

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(libdir)/gdk-pixbuf-2.0/2.10.0/loaders/*.la
	@rm -rf $(DESTDIR)$(libdir)/libgdk_pixbuf-2.0.la
	@rm -rf $(DESTDIR)$(libdir)/libgdk_pixbuf_xlib-2.0.la
	@$(MAKECOOKIE)
