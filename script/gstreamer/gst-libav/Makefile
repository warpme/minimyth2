GARNAME = gst-libav
GARVERSION = $(GST_VERSION)
CATEGORIES = gst
MASTER_SITES = $(GST_MASTER_SITES)
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c \
	gstreamer/gst-plugins-base \
	utils/bzip2 \
	lib/ffmpeg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--disable-static \
	--with-libav-extra-configure="--enable-runtime-cpudetect --as=$(CC)" \
	--with-pic \
	--with-system-libav

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

post-install:
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlibav.la
	@$(MAKECOOKIE)
