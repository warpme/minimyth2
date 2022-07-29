
GARNAME      = glib
GARVERSION   = 2.72.3
CATEGORIES   = gtk
MASTER_SITES = https://ftp.gnome.org/pub/gnome/sources/glib/2.72/
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = $(DISTNAME)-hack-to-pass-frexpl-check-on-arm64.patch
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS    = lang/c lib/libffi lib/pcre devel/zlib gtk/gtk-doc utils/util-linux

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D gtk_doc="false" \
	-D tests="false" \

include ../../gar.mk
