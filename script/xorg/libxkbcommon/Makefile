
GARNAME      = libxkbcommon
GARVERSION   = 1.0.3
CATEGORIES   = $(CATEGORY)
MASTER_SITES = http://xkbcommon.org/download/
DISTFILES    = $(DISTNAME).tar.xz
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION =.
define BLURB
endef

DEPENDS = lang/c wayland/wayland-core wayland/wayland-protocols

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	-D enable-docs="false" \

include ../../gar.mk
