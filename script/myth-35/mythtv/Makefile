
# DISABLE_LTO  = yes

GARNAME      = mythtv
GARVERSION   = $(MYTHTV_GIT_HASH)
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://github.com/MythTV/mythtv/archive/
DISTFILES    = $(MYTHTV_GIT_HASH).zip

include ../../minimyth.conf.mk

PATCHFILES  =

PATCHFILES += 0000-mythprotoserver-add-option-to-ignore-proto-DB-version-checks.patch
PATCHFILES += 0001-configure-disable-checks-perl-python-in-cross-compile.patch
PATCHFILES += 0002-configure-set-to-GAR-perl-python.patch.gar

# change to ifeq (0,1) if you want to disable all patches
ifeq (1,1)
# Fixes issue with only 3 menu entries in MythMediaStream theme.
PATCHFILES += 0013-MythMainWindow-not-use-qRound-in-MythUIScreenBounds.patch
# UPnP patches
PATCHFILES += 0030-UPnP-Change-reported-ver-to-1.patch
PATCHFILES += 0031-UPnP-Reduce-startup-latency-by-moving-blocking-code-to-own-thread.patch
PATCHFILES += 0032-UPnP-Add-playlist-recently-added-played-entries-to-upnp-music.patch

# Some patches for better logging
PATCHFILES += 0055-Loging-Add-AFD-original-channels-to-audio-format-loging.patch
PATCHFILES += 0057-Loging-Mythmusic-log-the-shoutcast-metadata-and-format.patch
PATCHFILES += 0058-Loging-add-some-DB-GetSetting-logging.patch
# speedup a bit portcheck
PATCHFILES += 0059-portchecker-speedup.patch

# Minimyth related patches
PATCHFILES += 0100-Minimyth-Add-maintain-menu.patch
PATCHFILES += 0101-Minimyth-Add-disable-optical-disc-in-menu.patch
PATCHFILES += 0102-Minimyth-Add-phone-entry-in-menu.patch
PATCHFILES += 0103-Minimyth-Add-optical-rip-to-menu.patch
PATCHFILES += 0104-Minimyth-Add-netflix-to-menus.patch
PATCHFILES += 0105-Minimyth-defaults.patch
PATCHFILES += 0106-hack-for-correct-perl-bindings-install.patch
PATCHFILES += 0107-settings-make-language-setting-per-host-setting.patch
PATCHFILES += 0108-audio-revert-91e5b1b4-fix-audio-noise-on-some-platofrms.patch
PATCHFILES += 0109-install-fix-nv-codec-headers-loc.patch
PATCHFILES += 0110-libmythui-devices-first-start-without-CEC.patch
PATCHFILES += 0111-mythfrontend-settings-create-Theme-DB-setting-at-first-run.patch
PATCHFILES += 0112-libs-libmythui-switch-default-theme-to-Monochrome.patch
PATCHFILES += 0113-Minimyth-reverse-profiles-in-v4l2-videoprofile.patch
PATCHFILES += 0114-mythfrontend-settings-set-gui-playback-mode-to-1920x1080-at-first-run.patch
# hack to get refresh rate changing on drm
PATCHFILES += 0115-libmythui-mythdrmdevice-add-refresh-change-capability.patch
# fix sometimes non-working 2x di
PATCHFILES += 0116-mythplayerui-fix-2x-di-sometimes-not-avaliable.patch
# Add v4l2_request support in configure
PATCHFILES += 0117-configure-add-v4l2request-support.patch
# enable LTO; patches from issue #224
PATCHFILES += 0118-configure-add-option-to-disable-ffmpeg-inline-asm.patch

ifeq (1,1)
# v4l2_m2m and v4l2_request patches
ifneq (,$(filter armv7 armv8,$(mm_GARCH)))
# prepre mythtv's v4l2 infra for ffmpeg7
PATCHFILES += 0150-libmythtv-decoders-mythv4l2m2mcontext-update-to-ffmpeg7.patch
# v4l2-request support in ffmpeg (requires also kernel patching)
PATCHFILES += 0155-ffmpeg-add-v4l2-request-kwiboo-20240805-g5dfc0cc8-hevc-jernej-v3.patch
# Fix for opposite fields usec in opengl di
PATCHFILES += 0156-mythdrmprimeinterop-swap-ttf-bff-and-set-di-level.patch
# make v4l2_request seeking on h264 content working
PATCHFILES += 0157-ffmpeg-libavcodec-h264dec.c-disable-ctx-reinit-at-flush.patch
# add hw deinterlace filter
PATCHFILES += 0158-ffmpeg-libavfilter-add-v4l2m2m-deinterlace-filter.patch
# add initial v4l2_requet av1 support
PATCHFILES += 0160-libmythtv-decoders-mythv4l2m2mcontext-add-av1_request-support.patch
# hack for smooth seeking on rpi3/4 statefull v4l2_m2m h264 decoder
PATCHFILES += 0161-hack-hack-hack-ffmpeg-libavcodec-v4l~m2m-backport-rpi-seek-improvements-v4.patch
endif
endif

# Mediamonitor patches
PATCHFILES += 0200-Mediamonitor-Exclude-minimyth-from-mediamonitor-paths.patch
PATCHFILES += 0201-Mediamonitor-reduce-udisks-timeout-to-1500msec.patch
PATCHFILES += 0202-Mediamonitor-make-mediamonitor-bluray-mounts-persistent.patch
# Fixes issue with LiveTV 'All tuners busy' just after FE resume (if media monitor is not enabled)
PATCHFILES += 0203-Mediamonitor-revert-16086d2-Honor-the-MonitorDrives-setting.patch
# Added UI to select multimedia handler in multimode CD's
PATCHFILES += 0204-Mediamonitor-add-UI-to-select-preferred-media-handler.patch
# Exclude some standard block dev.in TVboxes from mediamonitor
PATCHFILES += 0205-mediamonitor-exclude-standard-tvbox-disks.patch

# Misc frontend patches
PATCHFILES += 0212-external-udfread-fix-arm5te-compilation.patch
PATCHFILES += 0213-make-dvd-images-autoplay-at-media-insert.patch
PATCHFILES += 0214-themes-recordings-ui-all-episode-listing.patch
PATCHFILES += 0215-libmythtv-mythvideooutgpu-fix-tearing.patch

# Patches related to OSD
PATCHFILES += 0222-OSD-ticket9633-progressbar-on-osd.patch
PATCHFILES += 0223-OSD-Add-mythnotification-custom-styles-support-via-UDP.patch
PATCHFILES += 0224-OSD-Add-status-notify-to-mythmediacenter-wide.patch
PATCHFILES += 0225-OSD-Add-status-notify-to-mythmediacenter.patch
PATCHFILES += 0227-OSD-Add-interlaced-status-to-OSD-debug-screen.patch

# Patches enhancing Network Control
PATCHFILES += 0283-NetworkControl-Add-set-query-loglevel-commands.patch
PATCHFILES += 0284-NetworkControl-reduce-connects-logging.patch

# Patches for scripts
PATCHFILES += 0300-scripts-hardwareprofile-fix-add-aarch64-smolt.patch

# --------Patches 350+ are plugins patches---------------------
# Various mythmusic patches
PATCHFILES += 0405-MythMusic-Wait-for-scanner-and-eject-threads-before-deleting.patch
PATCHFILES += 0406-MythMusic-Make-initial-scan-by-CD-ripper-run-in-background.patch

# Various mythweather patches
PATCHFILES += 0450-MythWeather-Prevent-log-error-report-when-widget-not-found.patch

# Various mythzoneminder patches
PATCHFILES += 0500-mythzmserver-update-to-support-zm1.36.13.patch
PATCHFILES += 0501-mythzmserver-fix-event-streaming.patch

endif

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	python3/python \
	python3/python-setuptools \

DEPENDS = \
	lang/cxx \
	db/mariadb \
	db/sqlite \
	lib/alsa-lib \
	lib/avahi \
	lib/libbluray \
	lib/dav1d \
	lib/exiv2 \
	lib/flac \
	lib/freetype \
	lib/lame \
	lib/libass \
	lib/libavc1394 \
	lib/libcdaudio \
	lib/libcdio \
	lib/libcdio-paranoia \
	lib/libcoverart \
	lib/libcec \
	lib/libdiscid \
	lib/libexif \
	lib/libiconv \
	lib/libiec61883 \
	lib/libmusicbrainz5 \
	lib/libogg \
	lib/libtiff \
	lib/libsamplerate \
	lib/libsoundtouch \
	lib/libvorbis \
	lib/libxml2 \
	lib/libzip \
	lib/lzo \
	lib/openssl \
	lib/SDL2 \
	lib/taglib \
	devel/zlib \
	devel/yasm \
	python3/python \
	python3/python-aniso8601 \
	python3/python-beautifulsoup4 \
	python3/python-discid \
	python3/python-future \
	python3/python-lxml \
	python3/python-musicbrainzngs \
	python3/python-mysqlclient \
	python3/python-requests-cache \
	python3/python-oauth \
	python3/python-pycurl \
	python3/python-simplejson \
	python3/python-urlgrabber \
	perl/perl-Date-Calc \
	perl/perl-Date-Manip \
	perl/perl-DateTime-Format-ISO8601 \
	perl/perl-DBD-mysql \
	perl/perl-DBI \
	perl/perl-HTTP-Message \
	perl/perl-Image-Size \
	perl/perl-IO-Socket-INET6 \
	perl/perl-JSON \
	perl/perl-libwww-perl \
	perl/perl-Net-UPnP \
	perl/perl-XML-Simple \
	perl/perl-PerlMagick \
	perl/perl-SOAP-Lite \
	perl/perl-TimeDate \
	perl/perl-XML-Simple \
	perl/perl-XML-TreeBuilder \
	perl/perl-XML-XPath \
	system/lirc \
	system/eudev \
	utils/v4l-utils \
	X11/libvdpau \
	X11/libva \
	xorg/xorg \
	qt/qt \

DISTNAME_SHORT = $(GARNAME)-$(MYTHTV_GARVERSION_SHORT)

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythtv/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythtv/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythtv/Makefile source

comma:= ,

CONFIGURE_ARGS = \
	--compile-type=$(if $(filter yes,$(mm_DEBUG)),"debug","release") \
	--prefix="$(DESTDIR)$(prefix)" \
	--runprefix="$(prefix)" \
	--libdir-name="$(patsubst $(prefix)/%,%,$(libdir))" \
	--disable-ccache \
	--disable-distcc \
	--bindir="$(DESTDIR)$(bindir)" \
	--datadir="$(DESTDIR)$(datadir)/mythtv" \
	--libdir="$(DESTDIR)$(libdir)" \
	--incdir="$(DESTDIR)$(includedir)/mythtv" \
	--shlibdir="$(DESTDIR)$(libdir)" \
	--mandir="$(DESTDIR)$(mandir)" \
	$(if $(filter -Os,$(CFLAGS)),--enable-small) \
	--cross-prefix="$(compiler_prefix)" \
	--enable-cross-compile \
	--sysroot="$(DESTDIR)$(rootdir)" \
	--sysinclude="$(DESTDIR)$(includedir)" \
	--target-os="linux" \
	--ar="$(AR)" \
	--nm="$(NM)" \
	--ranlib="$(RANLIB)" \
	--as="$(CC)" \
	--cc="$(CC)" \
	--cxx="$(CXX)" \
	--ld="$(CC)" \
	--qmake="$(qtqmake)" \
	--host-cc="$(build_CC)" \
	--host-cflags="$(build_CFLAGS)" \
	--host-ldflags="$(build_LDFLAGS)" \
	--extra-cflags="$(CFLAGS)" \
	--extra-cxxflags="$(CXXFLAGS)" \
	$(if $(filter qt6,$(mm_QT_VERSION)), \
		--extra-ldflags="$(LDFLAGS) -Wl$(comma)-rpath-link$(comma)$(DESTDIR)$(qt6libdir)", \
		--extra-ldflags="$(LDFLAGS)") \
	--enable-symbol-visibility \
	--arch=$(GARCH_FAMILY) \
	--disable-altivec \
	--enable-amd3dnow \
	--enable-amd3dnowext \
	--enable-mmx \
	--enable-sse \
	--enable-ssse3 \
	--enable-yasm \
	--enable-asm \
	--enable-optimizations \
	$(if $(filter yes,$(DISABLE_LTO)),"--disable-lto","--enable-lto") \
	--disable-proc-opt \
	--enable-audio-oss \
	--enable-audio-alsa \
	--disable-audio-jack \
	--disable-audio-pulseoutput \
	--disable-valgrind \
	--enable-lirc \
	--disable-joystick-menu \
	--enable-firewire \
	--disable-hdhomerun \
	--disable-ceton \
	--enable-vaapi \
	--enable-dvb \
	--dvb-path="$(DESTDIR)$(includedir)" \
	--libcec-path="$(DESTDIR)$(includedir)/libcec" \
	--disable-asi \
	--enable-x11 \
	--x11-path="$(DESTDIR)$(includedir)" \
	--disable-dxva2 \
	$(if $(filter arm arm64,$(GARCH_FAMILY)), \
		--enable-v4l2 \
		--enable-v4l2request \
		--disable-vdpau, \
		--enable-vdpau) \
	--disable-mac-bundle \
	--enable-libxml2 \
	--enable-libdns_sd \
	--enable-libcrypto \
	--without-bindings="php" \
	--with-bindings="perl" \
	--with-bindings="python" \
	--enable-pic \
	--enable-libcec \
	--pkg-config="$(build_DESTDIR)$(build_bindir)/pkg-config" \
	--enable-ffplay \
	--enable-sdl2 \
	--python="python3" \
	--enable-silent-cc \
	$(if $(filter arm,$(GARCH_FAMILY)), --disable-inlineasm) \
	--enable-libdav1d \

GAR_EXTRA_CONF += python3/python/package-api.mk
include ../../gar.mk

CXXFLAGS += -I$(DESTDIR)$(includedir)/taglib
CPPFLAGS += -fPIC -fuse-linker-plugin -I$(DESTDIR)$(includedir)/taglib

ifeq ($(mm_DEBUG),yes)
CFLAGS   := $(filter-out -O%, $(CFLAGS)) -O0
CXXFLAGS := $(filter-out -O%, $(CXXFLAGS)) -O0
endif

ifeq ($(DISABLE_LTO),yes)
CFLAGS   := $(filter-out -flto=auto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto=auto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto=auto, $(LDFLAGS))
endif

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-source:
	@rm -rf $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@mkdir -p $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@rm -rf $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@ln -sf $(PWD)/$(WORKSRC)/mythtv $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@$(MAKECOOKIE)

pre-configure:
	@rm -rf $(DESTDIR)$(includedir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/libmyth*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libmyth*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/ffnvcodec.pc
	@rm -rf $(DESTDIR)$(libdir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV-*
	@echo 'BRANCH="$(MYTHTV_GARVERSION_SHORT)"' > $(WORKSRC)/mythtv/DESCRIBE
	@echo 'SOURCE_VERSION="$(MYTHTV_GIT_VERSION)"' >> $(WORKSRC)/mythtv/DESCRIBE
	@cd $(WORKSRC)/mythtv; ./version.sh ./
	@$(MAKECOOKIE)

post-configure:
	@rm -rf $(DESTDIR)$(includedir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/libmyth*
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV-*
	@$(MAKECOOKIE)

pre-install: post-configure

post-install:
ifneq ($(USE_CMAKE),yes)
	@$(MAKE) -C ../mythplugins install
endif
	@$(MAKE) -C ../myththeme-Monochrome-mm2 install
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(bindir)/mtd
	@rm -rf $(DESTDIR)$(bindir)/myth*
	@rm -rf $(DESTDIR)$(datadir)/myth*
	@rm -rf $(DESTDIR)$(includedir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/libmyth*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libmyth*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/ffnvcodec.pc
	@rm -rf $(DESTDIR)$(libdir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV-*
	@$(foreach dir,$(filter-out %/Makefile,$(wildcard ../../myth/* ../../myth-*/* ../myththeme-*)),$(MAKE) -C $(dir) clean ; )

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
		cp -a $(DISTNAME)-old $(DISTNAME)-new || exit 1 ; \
		cd $(DISTNAME)-new || exit 1 ; \
		SIMPLE_BACKUP_SUFFIX=.gar-source-update-patches patch -p1 < ../../../files/$(PATCHFILE) || exit 1 ; \
		cd ../ || exit 1 ; \
		find $(DISTNAME)-new -name *.gar-source-update-patches -exec rm {} \; || exit 1 ; \
		( diff -Naur $(DISTNAME)-old $(DISTNAME)-new > ../../files/$(PATCHFILE) ; test $$? -lt 2 ) || exit 1 ; \
		rm -fr $(DISTNAME)-old || exit 1 ; \
		mv $(DISTNAME)-new $(DISTNAME) || exit 1 ; \
		cd ../../ || exit 1 ; \
		rm -f checksums~ || exit 1 ; \
		cat checksums | grep -v $(DOWNLOADDIR)/$(PATCHFILE) > checksums~ || true ; \
		md5sum $(DOWNLOADDIR)/$(PATCHFILE) >> checksums~ || exit 1 ; \
		rm -f checksums || exit 1 ; \
		mv -f checksums~ checksums || exit 1 ; )
	@$(MAKE) clean
