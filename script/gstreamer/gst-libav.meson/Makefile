
GARNAME      = gst-libav
CATEGORIES   = gst
LICENSE      = GPL2

# Mainline gst-libav
ifeq (1,1)
GARVERSION   = $(GST_VERSION)
MASTER_SITES = $(GST_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.xz
endif

# GIT master gst-libav
ifeq (1,0)
GARVERSION   = 39e6f846e0e867185437925bf766a6ba10e6404f
MASTER_SITES = https://github.com/GStreamer/gst-libav/archive/
DISTFILES    = $(GARVERSION).zip
endif

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c \
	gstreamer/gst-plugins-base \
	utils/bzip2 \
	lib/ffmpeg4

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlibav.la
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlibav.so*
