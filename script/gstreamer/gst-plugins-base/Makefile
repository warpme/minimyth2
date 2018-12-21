GARNAME = gst-plugins-base
GARVERSION = $(GST_VERSION)
CATEGORIES = gst
MASTER_SITES = $(GST_MASTER_SITES)
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c \
          gstreamer/gstreamer \
          lib/alsa-lib \
          gtk/graphene \
          lib/libjpeg \
          lib/libjpeg-turbo \
          lib/libpng \
          lib/libtheora \
          lib/libvorbis \
          gtk/pango \
          lib/SDL \

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--disable-examples \

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgstallocators-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstapp-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstaudio-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstfft-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstgl-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstpbutils-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstriff-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstrtp-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstrtsp-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstsdp-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgsttag-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstvideo-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstadder.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalsa.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstapp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudioconvert.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiomixer.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiorate.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudioresample.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiotestsrc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcurl.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoretracers.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgio.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstencodebin.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstencoding.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsthls.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstkmssink.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstnetsim.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstogg.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpango.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstopengl.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstplayback.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpbtypes.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrawparse.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsubparse.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttcp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttheora.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttimecode.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttypefindfunctions.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideoframe_audiolevel.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideoconvert.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideorate.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideoscale.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideotestsrc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvolume.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvorbis.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstwaylandsink.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstximagesink.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstxvimagesink.la
	@$(MAKECOOKIE)
