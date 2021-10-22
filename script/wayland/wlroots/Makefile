
GARNAME      = wlroots
GARVERSION   = 0.13.0
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://github.com/swaywm/wlroots/archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = $(DISTNAME)-disable-Wmissing-includes.patch
PATCHFILES  += $(DISTNAME)-fix-ticket2852.patch
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	lib/libinput \
	xorg/libxkbcommon \
	opengl/opengl \
	xorg/pixman \
	xorg/xcb-util-image \
	xorg/xcb-util-wm \
	xorg/xcb-util-errors \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D man-pages="false" \
	-D valgrind="false" \
	-D examples="false" \

include ../../gar.mk
