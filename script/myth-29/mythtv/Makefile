GARNAME = mythtv
GARVERSION = $(MYTHTV_VERSION)
CATEGORIES = $(CATEGORY)
MASTER_SITES = svn://svn.mythtv.org/svn/trunk/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  =

PATCHFILES += 0000-configure-set-to-GAR-perl-python.patch.gar
PATCHFILES += 0000-mythprotoserver-add-option-to-ignore-proto-DB-version-checks.patch

# Backend needed patches
PATCHFILES += 0002-ticket9480_pl_eit_encodings.patch
PATCHFILES += 0003-delay_4_no_concurent_start_rec_v5.patch
PATCHFILES += 0004-eit_verbosity.patch
PATCHFILES += 0005-tid_debug_verbosity.patch
PATCHFILES += 0006-cardutil_show_displayname.patch
PATCHFILES += 0007-allow_no_tuners.patch
PATCHFILES += 0008-SCR_keep_disecq_always_18V.patch
# PATCHFILES += 0009-make_EIT_start_at_time-v5.patch
PATCHFILES += 0010-decrease-some-PMT-DVB-errors-logging.patch
PATCHFILES += 0012-add_verbose_dvb_lock_info.patch
PATCHFILES += 0018-fix-zoneminder-1.26.5.patch
PATCHFILES += 0019-mythlink-pretty-with-recgroup-subdir.patch
PATCHFILES += 0023-increase-loging-for-failed-tunings-v2.patch
PATCHFILES += 0030-0279-TV-Add-signal-monitor-warning-msg-if-NID-or-TSID-don.patch
PATCHFILES += 0031-add-manage-settings-in-mythutil-v2.patch

# solves issue of BE sometimes enter state with no aparent constant 100% load on single core.
PATCHFILES += 0033-revert-3330e28-Mark-rec-failing-if-ThreadedFileWriter-starts-ignoring.patch

PATCHFILES += 0034-disable-python-warnings-because-py2.6.patch

PATCHFILES += 0036-pull118-upnp-Add-playlist-recently-added-played-entries-to-upnp-music.patch
PATCHFILES += 0037-pull103-Add-heuristic-in-TMDB-script-to-detect-movie-release-years.patch

# Minimyth needed patches
PATCHFILES += 0100-minimyth.patch
PATCHFILES += 0101-programid.patch
PATCHFILES += 0102-maintain_menu.patch

# Frontend patches
PATCHFILES += 0200-ticket9633_progressbar_on_osd.patch
PATCHFILES += 0202-_LMSC_osd.patch
PATCHFILES += 0203-udisks_timeout.patch
PATCHFILES += 0204-netvision_build.patch
PATCHFILES += 0206-add-mythnotification-custom-styles-support-via-UDP.patch
PATCHFILES += 0207-add-osd-status-notify-to-mythmediacenter.patch
PATCHFILES += 0207-add-osd-status-notify-to-mythmediacenter-wide.patch
PATCHFILES += 0208-add-disable-optical-disc-by-mm-config.patch
PATCHFILES += 0209-add-phone-entry-in-themes.patch
PATCHFILES += 0210-add-option-to-not-remember-last-livetv-chan.patch
PATCHFILES += 0211-add-optical-rip-to-menu.patch
PATCHFILES += 0213-mythmusic_ticket10710_play_tracks_from_edit_trebors.patch

# Minimyth needed patches
PATCHFILES += 0214-minimyth-defaults.patch

# Fixes white rectriangle on Qt5 newer than 5.13
PATCHFILES += 0215-ticket13544-fix-white-square-on-qt514.patch

# Reverting this fixes issue with only 3 entries in mainmenu on MythmediaStream theme
PATCHFILES += 0217-revert-42bae47-MythMainWindow-Norm-With-very-small-values-of-x-scal.patch

# Needed to successfully applying 0235 & 0236
PATCHFILES += 0218-decrease-minQt-ver-to-4.8.patch

# LVR safe patches related to player/OSD
PATCHFILES += 0226-0186-mythplayer-Increase-resolution-of-onscreen-playback-.patch
PATCHFILES += 0231-0238-Player-Add-interlaced-status-to-OSD-debug-screen-vid.patch
PATCHFILES += 0232-0239-Playbackbox-Add-title-subtitle-and-description-filte.patch

# LVR safe patches with some usefull functionality
PATCHFILES += 0233-0257-FE-Add-a-UI-to-display-and-adjust-a-recording-s-star.patch
PATCHFILES += 0235-0290-FE-Add-a-menu-item-to-toggle-the-damaged-video-statu.patch
PATCHFILES += 0236-0330-FE-Add-a-menu-to-Playbackbox-to-change-the-recording.patch
PATCHFILES += 0252-0279-MythMusic-Visualisers-only-disable-screensaver-if-sh.patch
PATCHFILES += 0253-0297-Mythmusic-Log-the-shoutcast-metadata-and-format-stri.patch

PATCHFILES += 0272-0185-MythWeather-Prevent-log-error-report-Widget-not-foun.patch

# LVR safe patches with some usefull functionality
PATCHFILES += 0277-0202-FE-Fix-Display-MythDVD-menu-broken-when-MythDVD-plug-v3.patch

# LVR safe patches adding usefull logging functions
PATCHFILES += 0282-0059-NetworkControl-Add-realtime-display-of-MythEvents.patch
PATCHFILES += 0283-0210-FE-NetworkControl-Add-set-query-loglevel-commands.patch

# Support for Roger Siddons new gallery.
PATCHFILES += 0287-MythUiImage-Don-t-block-UI-when-exiting-screens.patch
PATCHFILES += 0288-Minimyth2-Cache-FE-gallery-images-in-remotecache.patch
PATCHFILES += 0289-Minimyth2-Use-remotecache-for-local-gallery-images.patch

# Fixes FE OOM when user enters previously recorded
PATCHFILES += 0291-ticket12463-temp-fix.patch

# Speedup FE starting
PATCHFILES += 0292-UPnP-Reduce-startup-latency-by-moving-blocking-code-to-own-thread.patch

# Various
PATCHFILES += 0293-0281-AFD-Add-original_channels-to-audio-format-log-output.patch
PATCHFILES += 0294-0283-FE-Add-network-status-to-machine-status-dialog.patch

# 0299 is needed by 0300
# 0300 is needed as without this BE sometimes deadlocks in comm.with FE
PATCHFILES += 0299-revert-ea5fdd4-Avoid-crash-when-file-transfer-can-t-open-files.patch
PATCHFILES += 0300-revert-916e43b-BE-Avoid-SEGV-when-accessing-discarded-MythSocket.patch

# Needed as perl5.12 under gcc5.3 has non-working sockets reads (???)
PATCHFILES += 0301-mythweather-scripts-replace-LWP-by-curl.patch

# Added as IMHO better have extra functions with old UI that no old UI and no functions
PATCHFILES += 0302-revert24c5575-revert-MediaMon-UI-to-select-preferred-media-handler.patch

# Various
PATCHFILES += 0303-0318-WebBrowser-Provide-virtual-keyboard-for-HTML-edit-co.patch

# Nice Roger Siddons guide grid enhacement
PATCHFILES += 0304-ticket12683-MythUI-Implement-zoomable-GuideGrids-v2.patch

# Nice Roger Siddons guide grid enhacement
PATCHFILES += 0305-ticket12809-Use-lastPlayPos-instead-of-bookmark-v5.patch
PATCHFILES += 0306-ticket12809-Watchlist-with-lastPlayPos-v4.patch
PATCHFILES += 0307-ticket12809-Add-Unfinished-recording-filter.patch

# Added as d43d8b1 causes unpleasant ffwd/bkwd playback skips with SD content 
PATCHFILES += 0309-revert-d43d8b1-revert-Player-Improve-low-bit-rate-high-latency-streams.patch

# Various LVR patches
PATCHFILES += 0312-0306-MythMusic-Avoid-a-SEGV-in-the-CD-ripper-ogg-encoder.patch
PATCHFILES += 0313-0307-MythMusic-Prevent-corruption-of-ripped-CD-music-file.patch
PATCHFILES += 0314-0308-MythMusic-Wait-for-CD-scanner-and-eject-threads-befo.patch
PATCHFILES += 0315-0309-MythMusic-Make-initial-scan-by-CD-ripper-run-in-back.patch
PATCHFILES += 0318-0337-Mythmusic-Provide-network-control-of-playlist.patch
PATCHFILES += 0320-0348-MythMusic-Add-network-control-commands-to-list-and-p-v2.patch

# Fixes focus issue in OSX
PATCHFILES += 0321-ticket12857-patch-mythwidgets_osx_focus.patch

PATCHFILES += 0322-add-netflix-to-thememenus.patch

# Fixes #12396 - issue with srt subtitles out-of-sync
PATCHFILES += 0323-ticket12396-.srt-subs-go-out-of-sync.patch

PATCHFILES += 0325-make-mediamonitor-bluray-mounts-persistent.patch

PATCHFILES += 0328-ticket13211-mythtv-29-aac-6-channel-audio-backport.patch

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/cxx \
	db/mariadb \
	db/sqlite \
	lib/alsa-lib \
	lib/avahi \
	lib/exiv2 \
	lib/fftw3 \
	lib/freetype \
	lib/lame \
	lib/libass \
	lib/libavc1394 \
	lib/libcdio \
	lib/libcdio-paranoia \
	lib/libiec61883 \
	lib/libxml2 \
	lib/openssl \
	lib/taglib \
	devel/zlib \
	python/python \
	python/python-MySQL-python \
	python/python-lxml \
	python/python-urlgrabber \
	qt/qt5 \
	qt/qt5-webkit \
	system/lirc \
	system/eudev \
	X11/libvdpau \
	xorg/xorg \
	devel/yasm \

BUILDDEPS = \
    python/python-MySQL-python \
    python/python-urlgrabber \

DISTNAME_SHORT = $(GARNAME)-$(MYTHTV_GARVERSION_SHORT)

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythtv/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythtv/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythtv/Makefile source

#	--sysroot="$(DESTDIR)$(rootdir)" \

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
	--sysinclude="$(DESTDIR)$(includedir)" \
	--target-os="linux" \
	--nm="$(NM)" \
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
	--tune=$(GARCH) \
	--cpu=$(GARCH) \
	--disable-altivec \
	--enable-amd3dnow \
	--enable-amd3dnowext \
	--enable-mmx \
	--enable-sse \
	--enable-ssse3 \
	--enable-yasm \
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
	--enable-ivtv \
	--enable-hdpvr \
	--enable-dvb \
	--dvb-path="$(DESTDIR)$(includedir)" \
	--disable-asi \
	--enable-x11 \
	--x11-path="$(DESTDIR)$(includedir)" \
	--enable-xrandr \
	--disable-xv \
	--enable-vdpau \
	--disable-crystalhd \
	--enable-vaapi \
	--disable-dxva2 \
	--enable-opengl-video \
	--disable-mac-bundle \
	--enable-libxml2 \
	--enable-libdns_sd \
	--enable-libcrypto \
	--without-bindings="php" \
	--with-bindings="perl" \
	--with-bindings="python" \
	--disable-mythlogserver \
	--enable-pic \
	--disable-libcec \
	--pkg-config="$(build_DESTDIR)$(build_bindir)/pkg-config" \

CONFIGURE_ENV  = $(MYTHTV_CONFIGURE_ENV)
BUILD_ENV      = $(MYTHTV_BUILD_ENV)
INSTALL_ENV    = $(MYTHTV_INSTALL_ENV)

BUILD_ENV     += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
INSTALL_ENV   += PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

CPPFLAGS += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd
CFLAGS   += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd
CXXFLAGS += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd

CPPFLAGS += -fPIC
CFLAGS   += -fPIC

ifeq ($(mm_OPENGL_PROVIDER),brcm-vc4)
CONFIGURE_ARGS += \
	--extra-cflags="-I$(DESTDIR)$(includedir)/IL" \
	--extra-cxxflags="-I$(DESTDIR)$(includedir)/IL" \
	--enable-openmax
endif

ifeq ($(mm_DEBUG),yes)
CFLAGS   := $(filter-out -O%, $(CFLAGS)) -O0
CXXFLAGS := $(filter-out -O%, $(CXXFLAGS)) -O0
endif

# mythtv don't compiles with gcc5.3.0 LTO
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

# "--extra-cxxflags='-DIGNORE_SCHEMA_VER_MISMATCH -DIGNORE_PROTO_VER_MISMATCH'

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
	@ln -sf $(DESTDIR)$(qt5libdir)/pkgconfig/Qt5WebKit.pc $(DESTDIR)$(qt5libdir)/pkgconfig/QtWebKit.pc
	@ln -sf $(DESTDIR)$(qt5libdir)/pkgconfig/Qt5Script.pc $(DESTDIR)$(qt5libdir)/pkgconfig/QtScript.pc
#	Myth ver.containing also MM2 version
#	@sed -i -e "s/MYTH_SOURCE_VERSION.*/MYTH_SOURCE_VERSION \"$(MYTHTV_GIT_VERSION)-v`grep "^mm_VERSION_MINIMYTH" ~/.minimyth/minimyth.conf.mk | sed -e 's/.*\?=\s*\(.*\)/\1/'`\"/" $(WORKSRC)/mythtv/version.sh
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
