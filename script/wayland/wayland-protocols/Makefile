
GARNAME      = wayland-protocols
GARVERSION   = 1.24
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://wayland.freedesktop.org/releases/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DEPENDS = wayland/wayland-core

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS_BUILD =

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D man-pages="false" \
	-D examples="false" \

include ../../gar.mk
