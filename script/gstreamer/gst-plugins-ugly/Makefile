
GARNAME      = gst-plugins-ugly
GARVERSION   = $(GST_VERSION)
CATEGORIES   = gst
MASTER_SITES = $(GST_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c \
	net/curl \
	opengl/glu \
	gstreamer/gst-plugins-base \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D tests=disabled \
	-D gobject-cast-checks=disabled \
	-D glib-asserts=disabled \

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

post-install:
	@#rm -f $(DESTDIR)$(libdir)/libgstadaptivedemux-1.0.la
	@#rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstyadif.la
	@$(MAKECOOKIE)

clean-all:
