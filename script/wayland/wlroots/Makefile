
GARNAME      = wlroots
GARVERSION   = 0.14.1
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://github.com/swaywm/wlroots/archive/
DISTFILES    = $(GARVERSION).tar.gz
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
	utils/seatd \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D man-pages="false" \
	-D valgrind="false" \
	-D examples="false" \
	-D xwayland="disabled" \
	-D x11-backend="disabled" \
	-D logind-provider=elogind \

include ../../gar.mk
