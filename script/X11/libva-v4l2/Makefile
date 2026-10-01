
# https://github.com/radxa-pkg/libva-v4l2
GARNAME      = libva-v4l2
GARVERSION   = 0e4ce1e05da1d0a92b342efc2090b9e4987035e1
MASTER_SITES = https://github.com/radxa-pkg/libva-v4l2/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/libva-v4l2-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c X11/libva xorg/xorg X11/libva

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS_BUILD =

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk

