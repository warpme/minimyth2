
GARNAME      = harfbuzz
GARVERSION   = 4.4.1
CATEGORIES   = gtk
MASTER_SITES = https://github.com/harfbuzz/harfbuzz/releases/download/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL

DEPENDS = lang/cxx gtk/cairo gtk/glib lib/freetype

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D tests="disabled" \
	-D docs="disabled" \
	-D benchmark="disabled" \

include ../../gar.mk
