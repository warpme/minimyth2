
GARNAME      = libxkbcommon
GARVERSION   = 1.13.2
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/
DISTFILES    = xkbcommon-$(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/libxkbcommon-xkbcommon-$(GARVERSION)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION =.
define BLURB
endef

DEPENDS = lang/c wayland/wayland-core wayland/wayland-protocols xorg/xkeyboard-config

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \

#	-D enable-docs="false" \

include ../../gar.mk
