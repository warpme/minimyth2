
GARNAME      = wayvnc
GARVERSION   = 0.4.0
CATEGORIES   = wayland
MASTER_SITES = https://github.com/any1/wayvnc/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c \
	wayland/wayland-core \
	wayland/wlroots \
	lib/aml \
	X11/neatvnc \
	xorg/libxkbcommon \
	xorg/pixman \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D man-pages="disabled" \
	-D systemtap="false" \

include ../../gar.mk
