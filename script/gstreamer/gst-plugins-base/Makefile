
GARNAME      = gst-plugins-base
GARVERSION   = $(GST_VERSION)
CATEGORIES   = gst
MASTER_SITES = $(GST_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

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

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D examples=disabled \
	-D tests=disabled \
	-D tools=enabled \
	-D introspection=disabled \
	-D gobject-cast-checks=disabled \
	-D glib-asserts=disabled \
	-D videoconvertscale=enabled \

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
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstoverlaycomposition.la
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

clean-all:
	@rm -f $(DESTDIR)$(libdir)/libgstallocators*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstapp*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstaudio*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstfft*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstgl*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstpbutils*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstriff*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstrtp*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstrtsp*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstsdp*.so*
	@rm -f $(DESTDIR)$(libdir)/libgsttag*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstvideo*.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstadder.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalsa.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstapp.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudioconvert.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiomixer.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiorate.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudioresample.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiotestsrc.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcurl.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoretracers.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgio.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstencodebin.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstencoding.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsthls.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstkmssink.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstnetsim.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstogg.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstoverlaycomposition.so
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpango.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstopengl.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstplayback.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpbtypes.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrawparse.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsubparse.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttcp.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttheora.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttimecode.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttypefindfunctions.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideoframe_audiolevel.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideoconvert.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideorate.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideoscale.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideotestsrc.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvolume.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvorbis.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstwaylandsink.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstximagesink.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstxvimagesink.so*
