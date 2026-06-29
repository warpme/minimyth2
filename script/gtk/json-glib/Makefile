
GARNAME      = json-glib
GARVERSION   = 1.10.8
CATEGORIES   = gtk
MASTER_SITES = https://gitlab.gnome.org/GNOME/json-glib/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2

LICENSE      = GPL

DEPENDS = lang/c gtk/glib

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk
