GARNAME = vlc
GARVERSION = 2.0.5
CATEGORIES = mediaplayers
MASTER_SITES  = http://download.videolan.org/pub/videolan/$(GARNAME)/$(GARVERSION)/
MASTER_SITES += http://download.videolan.org/pub/videolan/testing/$(DISTNAME)/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx \
	lib/alsa-lib \
	lib/ffmpeg \
	lib/fontconfig \
	lib/freetype \
	lib/fribidi \
	lib/libass \
	lib/libcdio \
	lib/libdvdnav \
	lib/libdvbpsi \
	lib/libpng \
	lib/libxml2 \
	lib/taglib \
	lib/zlib \
	system/lirc \
	X11/libvdpau \
	xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--disable-silent-rules \
	--without-contrib \
	--disable-static \
	--enable-shared \
	--with-gnu-ld \
	--enable-nls \
	--disable-rpath \
	--disable-non-utf8 \
	--disable-dbus \
	--disable-dbus-control \
	--disable-telepathy \
	--disable-debug \
	--disable-gprof \
	--disable-cprof \
	--disable-coverage \
	--disable-optimizations \
	--enable-mmx \
	--enable-sse \
	--disable-neon \
	--disable-altivec \
	--with-tuning=$(GARCH) \
	--disable-optimize-memory \
	--disable-run-as-root \
	--enable-sout \
	--disable-lua \
	--disable-httpd \
	--disable-vlm \
	--disable-libproxy \
	--disable-live555 \
	--disable-dc1394 \
	--disable-dv \
	--disable-linsys \
	--disable-dvdread \
	--enable-dvdnav \
	--disable-dshow \
	--disable-bluray \
	--disable-opencv \
	--disable-smb \
	--disable-sftp \
	--disable-v4l2 \
	--disable-pvr \
	--disable-decklink \
	--disable-gnomevfs \
	--disable-vcdx \
	--enable-vcd \
	--disable-libcddb \
	--disable-screen \
	--disable-realrtsp \
	--disable-macosx-eyetv \
	--disable-macosx-qtkit \
	--enable-dvbpsi \
	--disable-gme \
	--disable-sid \
	--disable-ogg \
	--disable-mux_ogg \
	--disable-shout \
	--disable-mkv \
	--disable-mod \
	--disable-mpc \
	--disable-wma-fixed \
	--disable-shine \
	--disable-omxil \
	--disable-iomx \
	--disable-crystalhd \
	--disable-mad \
	--disable-merge-ffmpeg \
	--enable-avcodec \
	--enable-libva \
	--disable-dxva2 \
	--disable-switcher \
	--enable-avformat \
	--enable-swscale \
	--enable-postproc \
	--disable-faad \
	--disable-twolame \
	--disable-quicktime \
	--disable-real \
	--disable-a52 \
	--disable-dca \
	--disable-flac \
	--disable-libmpeg2 \
	--disable-vorbis \
	--disable-tremor \
	--disable-speex \
	--disable-theora \
	--disable-dirac \
	--disable-schroedinger \
	--enable-png \
	--disable-x264 \
	--disable-fluidsynth \
	--disable-zvbi \
	--disable-telx \
	--enable-libass \
	--disable-kate \
	--disable-tiger \
	--disable-egl \
	--with-x \
	--enable-xcb \
	--enable-xvideo \
	--enable-glx \
	--disable-sdl \
	--disable-sdl-image \
	--disable-macosx-vout \
	--enable-freetype \
	--enable-fribidi \
	--enable-fontconfig \
	--disable-macosx-quartztext \
	--disable-svg \
	--disable-android-surface \
	--disable-ios-vout \
	--disable-directx \
	--disable-direct2d \
	--disable-wingdi \
	--disable-directfb \
	--disable-aa \
	--disable-caca \
	--disable-kva \
	--disable-pulse \
	--enable-alsa \
	--disable-oss \
	--disable-portaudio \
	--disable-waveout \
	--disable-macosx-audio \
	--disable-audioqueue \
	--disable-jack \
	--disable-opensles \
	--disable-samplerate \
	--disable-kai \
	--disable-skins2 \
	--disable-libtar \
	--disable-hildon \
	--disable-qt4 \
	--disable-macosx \
	--disable-macosx-dialog-provider \
	--disable-ncurses \
	--disable-xosd \
	--disable-fbosd \
	--enable-lirc \
	--disable-visual \
	--disable-goom \
	--disable-projectm \
	--disable-atmo \
	--disable-bonjour \
	--disable-udev \
	--disable-mtp \
	--disable-upnp \
	--enable-libxml2 \
	--disable-libgcrypt \
	--disable-gnutls \
	--enable-taglib \
	--disable-update-check \
	--disable-growl \
	--disable-notify \
	--disable-media-library \
	--disable-sqlite \
	--without-kde-solid \
	--disable-loader \
	--enable-vlc \
	--disable-macosx-vlc-app

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libvlc.la
	@rm -f $(DESTDIR)$(libdir)/libvlccore.la
	@rm -f `find $(DESTDIR)$(libdir)/vlc -name *.la`
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) -C ../vlc clean
	@rm -rf $(DESTDIR)$(bindir)/vlc
	@rm -rf $(DESTDIR)$(bindir)/cvlc
	@rm -rf $(DESTDIR)$(bindir)/rvlc
	@rm -rf $(DESTDIR)$(bindir)/vlc-wrapper
	@rm -rf $(DESTDIR)$(includedir)/vlc
	@rm -rf $(DESTDIR)$(libdir)/vlc
	@rm -rf $(DESTDIR)$(libdir)/libvlc.*
	@rm -rf $(DESTDIR)$(libdir)/libvlccore.*
	@rm -rf $(DESTDIR)$(datadir)/vlc
	@rm -rf $(DESTDIR)$(docdir)/vlc
