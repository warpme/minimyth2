
GARNAME      = MPlayer
GARVERSION   = $(MPLAYER_TRUNK_VERSION)
CATEGORIES   = mediaplayers
MASTER_SITES = svn://svn.mplayerhq.hu/mplayer/trunk/
SOURCEPKG    = lib/ffmpeg4 lib/libdvdnav lib/libdvdread
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = mplayer
mplayer_LICENSE_TEXT = $(WORKSRC)/Copyright

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/a52dec lib/alsa-lib lib/faad2 lib/ffmpeg4 lib/fontconfig lib/freetype lib/libbluray lib/libcdio lib/libdca lib/libjpeg lib/libmad lib/libpng devel/zlib lib/libdvdread lib/libdvdnav system/lirc X11/libva X11/libvdpau xorg/xorg
BUILDDEPS = devel/yasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile config

# Directories
CONFIGURE_ARGS_DIR = \
	--prefix="$(prefix)" \
	--bindir="$(bindir)" \
	--datadir="$(datadir)/mplayer" \
	--mandir="$(mandir)" \
	--confdir="$(sysconfdir)/mplayer" \
	--libdir="$(libdir)" \
	--codecsdir="$(libdir)/codecs"
# Optional features
# --enable-fontconfig must be auto or cflags and libs will not be determined correctly.
# Support for external dvdread appears to be broken.
CONFIGURE_ARGS_OPTIONAL = \
	--disable-mencoder \
	--enable-mplayer \
	--disable-gui \
	--disable-termcap \
	--disable-termios \
	--enable-iconv \
	--enable-langinfo \
	--enable-lirc \
	--disable-lircc \
	--disable-joystick \
	--disable-apple-remote \
	--disable-apple-ir \
	--enable-vm \
	--enable-xf86keysym \
	--disable-radio \
	--disable-radio-capture \
	--disable-radio-v4l2 \
	--disable-radio-bsdbt848 \
	--disable-tv \
	--disable-tv-v4l1 \
	--disable-tv-v4l2 \
	--disable-tv-bsdbt848 \
	--disable-pvr \
	--enable-rtc \
	--enable-networking \
	--disable-winsock2_h \
	--disable-smb \
	--disable-live \
	--disable-nemesi \
	--enable-librtmp \
	--enable-vcd \
	--enable-bluray \
	--enable-dvdnav \
	--enable-dvdread \
	--disable-cdparanoia \
	--disable-cddb \
	--disable-bitmap-font \
	--enable-freetype \
	--disable-unrarexec \
	--enable-menu \
	--enable-sortsub \
	--disable-fribidi \
	--disable-enca \
	--disable-maemo \
	--disable-macosx-finder \
	--disable-macosx-bundle \
	--disable-inet6 \
	--enable-gethostbyname2 \
	--enable-ftp \
	--disable-vstream \
	--enable-pthreads \
	--disable-w32threads \
	--enable-ass-internal \
	--enable-ass \
	--disable-rpath
# Codecs
# --enable-libcdio must be auto or cflags and libs will not be determined correctly.
# --enable-ffmpeg_so
# --enable-libdca
# --enable-liba52
CONFIGURE_ARGS_CODEC = \
	--disable-gif \
	--enable-png \
	--disable-mng \
	--enable-jpeg \
	--disable-liblzo \
	$(if $(filter i386,$(GARCH_FAMILY)),--enable-win32dll,--disable-win32dll) \
	$(if $(filter i386,$(GARCH_FAMILY)),--enable-qtx     ,--disable-qtx     ) \
	--enable-xanim \
	--enable-real \
	--disable-xvid \
	--disable-xvid-lavc \
	--disable-x264 \
	--disable-x264-lavc \
	--disable-libdirac-lavc \
	--disable-libschroedinger-lavc \
	--disable-libvpx-lavc \
	--disable-libnut \
	--disable-ffmpeg_a \
	--disable-libavcodec_mpegaudio_hp \
	--disable-tremor \
	--disable-libvorbis \
	--disable-speex \
	--disable-libgsm \
	--disable-theora \
	--enable-faad \
	--disable-faac \
	--disable-faac-lavc \
	--disable-ladspa \
	--disable-libbs2b \
	--disable-libdv \
	--disable-mpg123 \
	--enable-mad \
	--disable-mp3lame \
	--disable-mp3lame-lavc \
	--disable-toolame \
	--disable-twolame \
	--disable-xmms \
	--disable-libmpeg2 \
	--disable-libmpeg2-internal \
	--disable-musepack \
	--disable-libopencore_amrnb \
	--disable-libopencore_amrwb \
	--disable-libopenjpeg
# Video output: enable xv (requires x11 and vm), xvmc and vdpau.
CONFIGURE_ARGS_VIDEO = \
	--disable-vidix \
	--disable-vidix-pcidb \
	--disable-dhahelper \
	--disable-svgalib_helper \
	--enable-gl \
	--disable-matrixview \
	--disable-dga2 \
	--disable-dga1 \
	--disable-vesa \
	--disable-svga \
	--disable-sdl \
	--disable-kva \
	--disable-aa \
	--disable-caca \
	--disable-ggi \
	--disable-ggiwmh \
	--disable-direct3d \
	--disable-directx \
	--disable-dxr2 \
	--disable-dxr3 \
	--disable-ivtv \
	--disable-v4l2 \
	--disable-dvb \
	--disable-mga \
	--disable-xmga \
	--enable-xv \
	--enable-xvmc \
	--enable-vdpau \
	--enable-vm \
	--enable-xinerama \
	--enable-x11 \
	--disable-xshape \
	--disable-xss \
	--disable-fbdev \
	--disable-mlib \
	--disable-3dfx \
	--disable-tdfxfb \
	--disable-s3fb \
	--disable-wii \
	--disable-directfb \
	--disable-zr \
	--disable-bl \
	--disable-tdfxvid \
	--disable-xvr100 \
	--disable-tga \
	--disable-pnm \
	--disable-md5sum \
	--disable-yuv4mpeg \
	--disable-corevideo \
	--disable-quartz
# Audio output: enable alsa
CONFIGURE_ARGS_AUDIO = \
	--enable-alsa \
	--disable-ossaudio \
	--disable-arts \
	--disable-esd \
	--disable-pulse \
	--disable-jack \
	--disable-openal \
	--disable-nas \
	--disable-sgiaudio \
	--disable-sunaudio \
	--disable-kai \
	--disable-dart \
	--disable-win32waveout \
	--disable-coreaudio \
	--disable-select
# The --extra-cflags option forces configure to look in the correct directory for X11.
CONFIGURE_ARGS_MISC = \
	--charset="UTF-8" \
	--language-doc="all" \
	--language-man="all" \
	--language-man="all" \
	--language="all" \
	--enable-runtime-cpudetection \
	--enable-cross-compile \
	--cc="$(CC)" \
	--host-cc="$(build_CC)" \
	--as="$(AS)" \
	--nm="$(NM)" \
	--yasm=yasm \
	--ar="$(AR)" \
	--ranlib="$(RANLIB)" \
	--windres="false" \
	--target="$(GARCH_FAMILY)-linux" \
	--disable-static \
	--with-install="$(build_DESTDIR)$(build_bindir)/install"
CONFIGURE_ARGS_ADVANCED = \
	--enable-mmx \
	--enable-mmxext \
	--enable-3dnow \
	--enable-3dnowext \
	--enable-sse \
	--enable-sse2 \
	--enable-ssse3 \
	--enable-shm \
	--disable-altivec \
	--disable-armv5te \
	--disable-armv6 \
	--disable-armv6t2 \
	--disable-armvfp \
	--disable-neon \
	--disable-iwmmxt \
	--enable-fastmemcpy \
	--disable-hardcoded-tables \
	--disable-big-endian \
	--disable-debug \
	--disable-profile \
	--enable-sighandler \
	--disable-crash-debug \
	--disable-dynamic-plugins
CONFIGURE_ARGS_WITH = \
	--extra-cflags="-I$(DESTDIR)$(includedir)" \
	--extra-ldflags="-lva -lXext -lX11" \
	--with-xvmclib=XvMCW
CONFIGURE_ARGS = \
	$(CONFIGURE_ARGS_DIR) \
	$(CONFIGURE_ARGS_OPTIONAL) \
	$(CONFIGURE_ARGS_CODEC) \
	$(CONFIGURE_ARGS_VIDEO) \
	$(CONFIGURE_ARGS_AUDIO) \
	$(CONFIGURE_ARGS_MISC) \
	$(CONFIGURE_ARGS_ADVANCED) \
	$(CONFIGURE_ARGS_WITH)
INSTALL_ARGS   = \
	INSTALLSTRIP=

CONFIGURE_ENV  = \
	DESTDIR="$(DESTDIR)"
BUILD_ENV  = \
	DESTDIR="$(DESTDIR)"

include ../../gar.mk

CFLAGS :=

svn//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_SVN, svn://$*, $(GARVERSION), $(DISTNAME))
	@cd $(PARTIALDIR) ; tar -jxf $(DISTNAME).tar.bz2 ; rm -r $(DISTNAME).tar.bz2
	@cd $(PARTIALDIR) ; rm -rf $(DISTNAME)/ffmpeg
	@cd $(PARTIALDIR) ; rm -rf $(DISTNAME)/libdvdnav
	@cd $(PARTIALDIR) ; rm -rf $(DISTNAME)/libdvdread4
	@cd $(PARTIALDIR) ; rm -rf $(DISTNAME)/libswscale
	@cd $(PARTIALDIR) ; tar -jcf $(DISTNAME).tar.bz2 $(DISTNAME)
	@cd $(PARTIALDIR) ; rm -rf $(DISTNAME)
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

post-patch:
	@mv    $(wildcard $(WORKDIR)/ffmpeg-*)     $(WORKSRC)/ffmpeg
	@mv    $(wildcard $(WORKDIR)/libdvdnav-*)  $(WORKSRC)/libdvdnav
	@mv    $(wildcard $(WORKDIR)/libdvdread-*) $(WORKSRC)/libdvdread4
	@cp -r $(WORKSRC)/ffmpeg/libswscale        $(WORKSRC)/libswscale
	@$(MAKECOOKIE)

pre-configure:
	@echo $(GARVERSION) > $(WORKSRC)/snapshot_version
	@$(MAKECOOKIE)

install-config:
	@mkdir -p $(DESTDIR)$(rootdir)/root/.mplayer
	@cp $(WORKSRC)/etc/codecs.conf  $(DESTDIR)$(rootdir)/root/.mplayer
	@cp $(WORKSRC)/etc/example.conf $(DESTDIR)$(rootdir)/root/.mplayer
	@cp $(WORKSRC)/etc/input.conf   $(DESTDIR)$(rootdir)/root/.mplayer
	@cp $(WORKSRC)/etc/menu.conf    $(DESTDIR)$(rootdir)/root/.mplayer
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(bindir)/mplayer-svn
	@mv -f $(DESTDIR)$(bindir)/mplayer $(DESTDIR)$(bindir)/mplayer-svn
	@$(MAKECOOKIE)

source-update:
	@$(MAKE) source-update-source
	@$(MAKE) source-update-patches
	
source-update-source:
	@$(MAKE) clean
	@$(MAKE) fetch
	@$(MAKE) $(GARCHIVEDIR)/$(DISTNAME).tar.bz2
	@$(MAKE) clean

source-update-patches:
	@$(MAKE) clean
	@$(MAKE) extract
	@$(foreach PATCHFILE, $(PATCHFILES), \
		cd $(WORKDIR) || exit 1 ; \
		mv $(DISTNAME) $(DISTNAME)-old || exit 1 ; \
		cp -r $(DISTNAME)-old $(DISTNAME)-new || exit 1 ; \
		cd $(DISTNAME)-new || exit 1 ; \
		SIMPLE_BACKUP_SUFFIX=.gar-source-update-patches patch -p1 < ../../../files/$(PATCHFILE) || exit 1 ; \
		cd ../ || exit 1 ; \
		find $(DISTNAME)-new -name *.gar-source-update-patches -exec rm {} \; || exit 1 ; \
		( diff -Naur $(DISTNAME)-old $(DISTNAME)-new > ../../files/$(PATCHFILE) ; test $$? -lt 2 ) || exit 1 ; \
		rm -fr $(DISTNAME)-old || exit 1 ; \
		mv $(DISTNAME)-new $(DISTNAME) || exit 1 ; \
		cd ../../ || exit 1 ; \
		rm -f checksums~ || exit 1 ; \
		cat checksums | grep -v $(DOWNLOADDIR)/$(PATCHFILE) > checksums~ ; \
		md5sum $(DOWNLOADDIR)/$(PATCHFILE) >> checksums~ || exit 1 ; \
		rm -f checksums || exit 1 ; \
		mv -f checksums~ checksums || exit 1 ; )
	@$(MAKE) clean
