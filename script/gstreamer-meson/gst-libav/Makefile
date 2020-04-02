
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

#	lib/ffmpeg

CONFIGURE_SCRIPTS  = custom
BUILD_SCRIPTS      = custom
INSTALL_SCRIPTS    = custom

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

CONFIGURE_ARGS = \
	--prefix="$(DESTDIR)" \
	--libdir="$(DESTDIR)$(libdir)" \
	--includedir="$(DESTDIR)$(includedir)" \
	--datadir="$(DESTDIR)$(datadir)" \
	--cross-file=$(build_DESTDIR)$(build_datadir)/meson/cross/$(GARHOST).conf \
	--buildtype=release \
	--wrap-mode=forcefallback \

configure-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/meson build $(CONFIGURE_ARGS)
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/meson configure build
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/ninja -C build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/ninja -C build install
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlibav.la
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlibav.so*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libswscale.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libswresample.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libpostproc.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavutil.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavformat.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavfilter.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavdevice.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavcodec.pc
