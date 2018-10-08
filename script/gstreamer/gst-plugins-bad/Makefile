GARNAME = gst-plugins-bad
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
	lib/libgcrypt \
	lib/faad2 \
	net/curl \
	lib/faad2 \
	xorg/glu \
	gstreamer/gst-plugins-base \
	lib/libdca \
	lib/libdvdnav \
	lib/libdvdread \
	lib/libexif \
	lib/libgudev \
	lib/libusb \
	X11/libvdpau \
	xorg/wayland \

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--disable-qt

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgstadaptivedemux-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstbadaudio-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstbadbase-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstbadvideo-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstadaptivedemux-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstbadbase-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstbadvideo-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstbasecamerabinsrc-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstcodecparsers-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstgl-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstinsertbin-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstisoff-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstmpegts-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstphotography-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstplayer-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgsturidownloader-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstwayland-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstwebrtc-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaccurip.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiobuffersplit.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiolatency.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiomixmatrix.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstbadaudio-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstadpcmdec.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstadpcmenc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaiff.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstasfmux.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstassrender.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiofxbad.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiomixer.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstaudiovisualizers.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstautoconvert.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstbayer.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstbz2.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcamerabin.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcamerabin2.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoloreffects.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcompositor.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcurl.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdashdemux.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdataurisrc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdebugutilsbad.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdecklink.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdtls.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdtsdec.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdvb.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdvbsuboverlay.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstdvdspu.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstfaad.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstfaceoverlay.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstfbdevsink.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstfestival.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstfieldanalysis.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstfragmented.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstfreeverb.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstfrei0r.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgaudieffects.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgdp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstgeometrictransform.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsthls.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstid3tag.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstinter.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstinterlace.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstipcpipeline.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstivfparse.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstivtc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstjp2kdecimator.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstjpegformat.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsttimecode.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstkms.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstkmssink.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstlegacyrawparse.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstliveadder.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmidi.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmpegpsdemux.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmpegpsmux.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmpegtsdemux.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmpegtsmux.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstmxf.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstnetsim.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstopengl.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstopenglmixers.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpcapparse.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstplayer-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpnm.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpbtypes.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstproxy.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrawparse.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstremovesilence.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstresindvd.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrfbsrc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtmp.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtpbad.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstrtponvif.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsdpelem.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsegmentclip.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstshm.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsiren.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsmooth.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsmoothstreaming.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsndfile.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstspeed.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgststereo.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstsubenc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstuvch264.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstwaylandsink.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvcdsrc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvdpau.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideofiltersbad.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideoframe_audiolevel.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideoparsersbad.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvideosignal.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvmnc.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgsty4mdec.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstyadif.la
	@$(MAKECOOKIE)

