
GARNAME      = sway
GARVERSION   = 1.6.1
CATEGORIES   = wayland
MASTER_SITES = https://github.com/swaywm/sway/releases/download/$(GARVERSION)/
PATCHFILES   = $(DISTNAME)-skip-uid-guid-drop-check.patch
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c \
	wayland/wayland-core \
	gtk/cairo \
	gtk/gdk-pixbuf \
	gtk/pango \
	lib/polkit \
	lib/pcre \
	lib/libjson-c \
	wayland/wlroots \
	data/shared-mime-info \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D man-pages="disabled" \
	-D gdk-pixbuf="disabled" \
	-D xwayland="disabled" \

include ../../gar.mk
