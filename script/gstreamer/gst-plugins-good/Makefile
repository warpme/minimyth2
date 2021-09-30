
GARNAME      = gst-plugins-good
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
	gstreamer/gst-plugins-base \
	gtk/cairo \
	lib/flac \
	lib/lame \
	lib/libavc1394 \
	lib/libgudev \
	lib/libiec61883 \
	lib/libraw1394 \
	lib/libshout \
	lib/libvpx \
	xorg/libXdamage \
	lib/taglib \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

CONFIGURE_ARGS = $(DIRPATHS_MESON) \
	--buildtype=release \
	-D examples=disabled \
	-D tests=disabled \
	-D gobject-cast-checks=disabled \
	-D glib-asserts=disabled \
	-D qt5=disabled \

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgst1394.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalaw.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalpha.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalphacolor.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstapetag.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiofx.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudioparsers.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstauparse.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstautodetect.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstavi.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcairo.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcutter.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdebug.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdeinterlace.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdtmf.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsteffectv.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstequalizer.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstflac.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstflv.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstflxdec.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgdkpixbuf.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgoom.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgoom2k1.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsticydemux.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstid3demux.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstimagefreeze.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstinterleave.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstisomp4.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstjpeg.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlame.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlevel.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmatroska.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmulaw.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmultifile.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmultipart.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstnavigationtest.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstoss4audio.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstoss4.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstossaudio.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpng.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstreplaygain.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtpmanager.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtsp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstshapewipe.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstshout2.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsmpte.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstspectrum.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttaglib.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstudp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideo4linux2.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideobox.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideocrop.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideofilter.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideomixer.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvpx.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstwavenc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstwavparse.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstximagesrc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsty4menc.la
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgst1394.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalaw.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalpha.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalphacolor.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstapetag.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiofx.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudioparsers.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstauparse.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstautodetect.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstavi.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcairo.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcutter.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdebug.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdeinterlace.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdtmf.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsteffectv.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstequalizer.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstflac.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstflv.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstflxdec.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgdkpixbuf.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgoom.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgoom2k1.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsticydemux.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstid3demux.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstimagefreeze.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstinterleave.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstisomp4.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstjpeg.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlame.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlevel.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmatroska.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmulaw.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmultifile.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmultipart.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstnavigationtest.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstoss4audio.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstoss4.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstossaudio.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpng.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstreplaygain.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtp.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtpmanager.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtsp.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstshapewipe.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstshout2.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsmpte.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstspectrum.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttaglib.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstudp.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideo4linux2.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideobox.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideocrop.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideofilter.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideomixer.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvpx.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstwavenc.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstwavparse.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstximagesrc.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsty4menc.so*
