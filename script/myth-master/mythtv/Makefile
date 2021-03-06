
GARNAME      = mythtv
GARVERSION   = $(MYTHTV_VERSION)
CATEGORIES   = $(CATEGORY)
MASTER_SITES = svn://svn.mythtv.org/svn/trunk/
DISTFILES    = $(DISTNAME).tar.bz2
PATCHFILES   =

include ../../minimyth.conf.mk

PATCHFILES += 0000-mythprotoserver-add-option-to-ignore-proto-DB-version-checks.patch
PATCHFILES += 0000-configure-set-to-GAR-perl-python.patch.gar

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

ifeq (1,1)
# v4l2-request support in ffmpeg for 5.10 kernel (requires patching also 5.10 kernel)
# Based on:
# https://github.com/jernejsk/LibreELEC.tv/tree/69fae8524b9ef02cd2e3415ece1ae01dfc2b5426/packages/multimedia/ffmpeg/patches 29.10.2020
# https://github.com/Kwiboo/FFmpeg/commit/5e9575a822a94139bdcfe6a7fa78e4ef771ccb39
# patch with experimental rpi v4l2_request added
PATCHFILES += 0150-ffmpeg-uapi-update-hevc-ctl-header.patch
ifneq (,$(filter %5.10,$(mm_KERNEL_VERSION)))
PATCHFILES += 0151-ffmpeg-add-V4l2_request-support-5.10kernel.patch
else
PATCHFILES += 0151-ffmpeg-add-V4l2_request-support-5.11kernel.patch
endif
# Enable v4l2_request in myth configure
PATCHFILES += 0152-configure-add-v4l2request-support.patch
# Add HW deinterlacer support on Allwinner H6
PATCHFILES += 0153-ffmpeg-add-H6-HW-deinterlacer-support-5.10kernel.patch
# Improve v4l2_request resiliency on so DVB stream errors (http://jernej.libreelec.tv/videos/cedrus_broken.ts)
PATCHFILES += 0154-ffmpeg-v4l2_request-improve-resilience-on-h264-stream-errors.patch
endif

# buffers bump-up required for AML HD playbck
PATCHFILES += 0171-v4l2decoder-increase-cap-buffers-to-16.patch
# mute Invalid UE golomb code reposts on hevc tv playback
PATCHFILES += 0172-ffmpeg-libavcodec-reduce-Invalid-UE-golomb-error-code.patch
# enable LTO; patches from issue #224
PATCHFILES += 0197-configure-add-option-to-disable-ffmpeg-inline-asm.patch

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
PATCHFILES += 0211-decrease-minQt-ver-to-4.8.patch
PATCHFILES += 0212-external-udfread-fix-arm5te-compilation.patch
PATCHFILES += 0213-MythDVD-Fix-broken-DVDmenu.patch
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

# --------Patches 400+ are plugins patches---------------------

# Various mythmusic patches
PATCHFILES += 0400-Mythmusic-ticket10710-play-tracks-from-edit.patch
PATCHFILES += 0404-MythMusic-Prevent-corruption-of-ripped-CD-music-file.patch
PATCHFILES += 0405-MythMusic-Wait-for-scanner-and-eject-threads-before-deleting.patch
PATCHFILES += 0406-MythMusic-Make-initial-scan-by-CD-ripper-run-in-background.patch

# Various mythweather patches
PATCHFILES += 0450-MythWeather-Prevent-log-error-report-when-widget-not-found.patch

endif

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/cxx \
	db/mysql \
	db/sqlite \
	lib/alsa-lib \
	lib/avahi \
	lib/exiv2 \
	lib/fftw3 \
	lib/fftw3f \
	lib/freetype \
	lib/lame \
	lib/libass \
	lib/libavc1394 \
	lib/libcdio \
	lib/libcdio-paranoia \
	lib/libcec \
	lib/libiec61883 \
	lib/libxml2 \
	lib/lzo \
	lib/openssl \
	lib/libsamplerate \
	lib/libbluray \
	lib/SDL2 \
	lib/taglib \
	devel/zlib \
	devel/yasm \
	python/python \
	python/python-future \
	python/python-lxml \
	python/python-MySQL-python \
	python/python-requests-cache \
	python/python-simplejson \
	python/python-urlgrabber \
	perl/perl-DBD-mysql \
	perl/perl-DBI \
	perl/perl-HTTP-Message \
	perl/perl-IO-Socket-INET6 \
	perl/perl-libwww-perl \
	perl/perl-Net-UPnP \
	perl/perl-XML-Simple \
	system/lirc \
	system/eudev \
	X11/libvdpau \
	X11/libva \
	xorg/xorg \
	qt/qt5 \
	qt/qt5-webkit \

BUILDDEPS = \
	python/python \
	python/python-future \
	python/python-lxml \
	python/python-MySQL-python \
	python/python-requests-cache \
	python/python-simplejson \
	python/python-urlgrabber \
	perl/perl-DBD-mysql \
	perl/perl-DBI \
	perl/perl-HTTP-Message \
	perl/perl-IO-Socket-INET6 \
	perl/perl-libwww-perl \
	perl/perl-Net-UPnP \
	perl/perl-XML-Simple \

DISTNAME_SHORT = $(GARNAME)-$(MYTHTV_GARVERSION_SHORT)

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythtv/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythtv/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythtv/Makefile source


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
	--qmake="$(DESTDIR)$(qt5bindir)/qmake" \
	--host-cc="$(build_CC)" \
	--host-cflags="$(build_CFLAGS)" \
	--host-ldflags="$(build_LDFLAGS)" \
	--extra-cflags="$(CFLAGS)" \
	--extra-cxxflags="$(CXXFLAGS)" \
	--extra-ldflags="$(LDFLAGS)" \
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
	--enable-fast-unaligned \
	--enable-optimizations \
	--enable-lto \
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
	--enable-v4l2 \
	--enable-v4l2request \
	--enable-vaapi \
	--enable-ivtv \
	--enable-hdpvr \
	--enable-dvb \
	--dvb-path="$(DESTDIR)$(includedir)" \
	--libcec-path="$(DESTDIR)$(includedir)/libcec" \
	--disable-asi \
	--enable-x11 \
	--x11-path="$(DESTDIR)$(includedir)" \
	--disable-dxva2 \
	$(if $(filter arm arm64,$(GARCH_FAMILY)), \
		--disable-vdpau) \
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
	--python="python" \
	$(if $(filter arm,$(GARCH_FAMILY)), --disable-inlineasm) \

CONFIGURE_ENV  = $(MYTHTV_CONFIGURE_ENV)
BUILD_ENV      = $(MYTHTV_BUILD_ENV)
INSTALL_ENV    = $(MYTHTV_INSTALL_ENV)

BUILD_ENV     += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
INSTALL_ENV   += PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages


GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

CPPFLAGS += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd -I$(DESTDIR)$(includedir)/taglib
CFLAGS   += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd -I$(DESTDIR)$(includedir)/taglib
CXXFLAGS += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd -I$(DESTDIR)$(includedir)/taglib

CPPFLAGS += -fPIC -fuse-linker-plugin
CFLAGS   += -fPIC -fuse-linker-plugin

ifeq ($(mm_DEBUG),yes)
CFLAGS   := $(filter-out -O%, $(CFLAGS)) -O0
CXXFLAGS := $(filter-out -O%, $(CXXFLAGS)) -O0
endif

svn//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_SVN, http://$*, $(MYTHTV_SVN_VERSION), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-source:
	@rm -rf $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@mkdir -p $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@rm -rf $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@ln -sf $(PWD)/$(WORKSRC)/mythtv $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@$(MAKECOOKIE)

post-install: post-install-mythtv-version
	@rm -f $(DESTDIR)$(bindir)/mythtv
	@mv $(DESTDIR)$(bindir)/mythavtest $(DESTDIR)$(bindir)/mythtv
	@$(MAKECOOKIE)

pre-configure:
	@#Myth ver.containing also MM2 version
	@#sed -i -e "s/MYTH_SOURCE_VERSION.*/MYTH_SOURCE_VERSION \"$(MYTHTV_GIT_VERSION)-v`grep "^mm_VERSION_MINIMYTH" ~/.minimyth/minimyth.conf.mk | sed -e 's/.*\?=\s*\(.*\)/\1/'`\"/" $(WORKSRC)/mythtv/version.sh
	@sed -i -e "s/MYTH_SOURCE_VERSION.*/MYTH_SOURCE_VERSION \"$(MYTHTV_GIT_VERSION)\"/" $(WORKSRC)/mythtv/version.sh
	@sed -i -e "s/MYTH_SOURCE_PATH.*/MYTH_SOURCE_PATH \"$(mm_MYTH_VERSION)\"/" $(WORKSRC)/mythtv/version.sh
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(bindir)/mtd
	@rm -rf $(DESTDIR)$(bindir)/myth*
	@rm -rf $(DESTDIR)$(datadir)/myth*
	@rm -rf $(DESTDIR)$(includedir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/libmyth*
	@rm -rf $(DESTDIR)$(libdir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV-*
	@$(foreach dir,$(filter-out %/Makefile,$(wildcard ../../myth/* ../../myth-*/*)),$(MAKE) -C $(dir) clean ; )

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
		cat checksums | grep -v $(DOWNLOADDIR)/$(PATCHFILE) > checksums~ || true ; \
		md5sum $(DOWNLOADDIR)/$(PATCHFILE) >> checksums~ || exit 1 ; \
		rm -f checksums || exit 1 ; \
		mv -f checksums~ checksums || exit 1 ; )
	@$(MAKE) clean
