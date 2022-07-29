
GARNAME      = gobject-introspection
GARVERSION   = 1.71.0
CATEGORIES   = gtk
MASTER_SITES = https://gitlab.gnome.org/GNOME/gobject-introspection/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL

DEPENDS = python3/python-mako 
#python3/python-markdown

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D gtk_doc="false" \
	-D doctool="disabled" \

include ../../gar.mk

