
GARNAME      = wlroots
GARVERSION   = 0.18.0
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/$(GARVERSION)/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

WORKSRC = $(WORKDIR)/$(DISTNAME)-4666996b2a34b53899aedafcd3586fb1c7a16af6

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
	-D examples="false" \
	-D xwayland="disabled" \

include ../../gar.mk
