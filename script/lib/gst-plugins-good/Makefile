GARNAME = gst-plugins-good
GARVERSION = 1.10.2
CATEGORIES = system
MASTER_SITES = http://gstreamer.freedesktop.org/src/gst-plugins-good/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c \
	lib/gst-plugins-base \
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

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr

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
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlevel.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmatroska.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmulaw.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmultifile.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmultipart.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstnavigationtest.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstoss4audio.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstossaudio.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpng.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstreplaygain.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtpmanager.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtsp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstshapewipe.la
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
