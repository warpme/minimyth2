GARNAME = gst-libav
GARVERSION = 1.10.2
CATEGORIES = system
MASTER_SITES = http://gstreamer.freedesktop.org/src/gst-libav/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/gst-plugins-base utils/bzip2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--disable-static \
	--with-libav-extra-configure="--enable-runtime-cpudetect" \
	--with-pic \
	--without-system-libav

include ../../gar.mk

CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

post-install:
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlibav.la
	@$(MAKECOOKIE)
