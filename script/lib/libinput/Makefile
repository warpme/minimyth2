
GARNAME      = libinput
GARVERSION   = 1.17.1
CATEGORIES   = lib
MASTER_SITES = https://freedesktop.org/software/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/libcheck

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	-D test="false" \
	-D udev="true" \
	-D libwacom="false" \
	-D documentation="false" \
	-D debug-gui="false"

include ../../gar.mk
