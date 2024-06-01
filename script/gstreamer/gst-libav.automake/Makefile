
# this package is build with old Automake way as I can't find
# way to build it on Meson with build-in FFmpeg.
# Building with build-in FFmpeg and exact 1.16.2 version of gst-libav
# is only solution to get HTML video playback working ok in QtWebKIT.
# This package build against external FFmpeg gives still picture in HTML5
# video playback in QtWebKIT

GARNAME      = gst-libav
GARVERSION   = 1.16.2
CATEGORIES   = gst
MASTER_SITES = $(GST_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c \
	gstreamer/gst-plugins-base \
	utils/bzip2 \

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--disable-static \
	--with-libav-extra-configure="--enable-runtime-cpudetect --as=$(CC)" \
	--with-pic \

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

post-install:
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlibav.la
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlibav.so*
