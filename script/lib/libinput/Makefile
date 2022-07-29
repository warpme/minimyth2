
GARNAME      = libinput
GARVERSION   = 1.21.0
CATEGORIES   = lib
MASTER_SITES = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/libcheck

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	-D libwacom="false" \
	-D documentation="false" \
	-D debug-gui="false"

include ../../gar.mk
