
GARNAME      = libdisplay-info
GARVERSION   = 0.1.1
CATEGORIES   = lib
MASTER_SITES = https://gitlab.freedesktop.org/emersion/libdisplay-info/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = MIT

DEPENDS = lang/c

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk
