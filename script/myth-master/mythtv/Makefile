GARNAME = mythtv
GARVERSION = $(MYTHTV_VERSION)
CATEGORIES = $(CATEGORY)
MASTER_SITES = svn://svn.mythtv.org/svn/trunk/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  =

# Backend needed patches
#PATCHFILES += 0001-ticket2416_copy_eit_2_other_source.patch
PATCHFILES += 0002-ticket9480_pl_eit_encodings.patch
PATCHFILES += 0003-delay_4_no_concurent_start_rec.patch
PATCHFILES += 0004-eit_verbosity.patch
PATCHFILES += 0005-tid_debug_verbosity.patch
PATCHFILES += 0006-cardutil_show_displayname.patch
PATCHFILES += 0007-allow_no_tuners.patch
PATCHFILES += 0008-SCR_keep_disecq_always_18V.patch
PATCHFILES += 0009-make_EIT_start_at_time.patch
PATCHFILES += 0012-add_verbose_dvb_lock_info.patch
PATCHFILES += 0017-python_bindings_tztime_error.patch
PATCHFILES += 0018-fix-zoneminder-1.26.5.patch
PATCHFILES += 0019-mythlink-pretty-with-recgroup-subdir.patch
PATCHFILES += 0020-h264-seek-table.patch
PATCHFILES += 0021-ticket12248-livetv-transitions-demonstrate-bad-decoder-start-conditions.patch
PATCHFILES += 0022-ticket12308-commflag-improvements.patch
PATCHFILES += 0023-increase-loging-for-failed-tunings.patch
PATCHFILES += 0025-ticket12260-pythonbindings-dataheap-fix.patch

# Minimyth needed patches
PATCHFILES += 0100-minimyth.patch
PATCHFILES += 0101-programid.patch
PATCHFILES += 0102-maintain_menu.patch
PATCHFILES += 0103-minimyth-defaults.patch

# Frontend patches
PATCHFILES += 0200-ticket9633_progressbar_on_osd.patch
PATCHFILES += 0202-_LMSC_osd.patch
PATCHFILES += 0203-udisks_timeout.patch
PATCHFILES += 0204-netvision_build.patch
# PATCHFILES += 0205-mythmusic_quick_browsing.patch
PATCHFILES += 0206-add-mythnotification-custom-styles-support-via-UDP.patch
PATCHFILES += 0207-add-osd-status-notify-to-mythmediacenter.patch
PATCHFILES += 0208-add-disable-optical-disc-by-mm-config.patch
PATCHFILES += 0209-add-phone-entry-in-themes.patch
PATCHFILES += 0210-add-option-to-not-remember-last-livetv-chan.patch
PATCHFILES += 0211-add-optical-rip-to-menu.patch
PATCHFILES += 0212-ticket12311.patch
PATCHFILES += 0213-mythmusic_ticket10710_play_tracks_from_edit_trebors.patch
# PATCHFILES += 0214-ticket12015-configure-not-passing-cppxx-flags.patch

# 0217: fixes issue with only 3 entries in mainmenu on MythmediaStream
PATCHFILES += 0217-revert-42bae47-MythMainWindow-Norm-With-very-small-values-of-x-scal.patch

# PATCHFILES += 0218-xinitthreads.patch

# 0219: needed to have working #12311. Without revert just after start, is GUI is shoifted by 1px
PATCHFILES += 0219-revert-1c440ba-Fix-fullscreen-windowing-with-Compiz-Unity.patch

# 7.6.3 Added new Gallery
PATCHFILES += 0220-ticket12424-Replacement-Gallery-using-MythUI-Storage-Groups-Centre-zoomed-images.patch
PATCHFILES += 0221-ticket12424-Replacement-Gallery-using-MythUI-Storage-Groups-Orient-before-resize.patch
PATCHFILES += 0222-ticket12424-Replacement-Gallery-using-MythUI-Storage-Groups-Fix-image-orientation.patch
PATCHFILES += 0223-ticket12424-Replacement-Gallery-using-MythUI-Storage-Groups-Replacement-Gallery-using-MythUI-storage-groups.patch
PATCHFILES += 0224-ticket12424-Replacement-Gallery-using-MythUI-Storage-Groups-Cache-FE-gallery-images-in-remotecache-for-Minimyth2.patch
PATCHFILES += 0225-Log-image-loading-threads.patch

# 7.6.4 LVR safe patches related to player/OSD
PATCHFILES += 0226-0186-mythplayer-Increase-resolution-of-onscreen-playback-.patch
# PATCHFILES += 0227-0194-Playback-data-Use-average-read-time-to-calculate-sto.patch
PATCHFILES += 0228-0198-Player-Avoid-unnecessary-calls-to-ReinitOSD.patch
PATCHFILES += 0231-0238-Player-Add-interlaced-status-to-OSD-debug-screen-vid.patch
PATCHFILES += 0232-0239-Playbackbox-Add-title-subtitle-and-description-filte.patch
PATCHFILES += 0233-0257-FE-Add-a-UI-to-display-and-adjust-a-recording-s-star.patch
PATCHFILES += 0234-0261-FE-Playbackbox-ensure-stereo-icon-takes-precedence-o.patch
PATCHFILES += 0235-0290-FE-Add-a-menu-item-to-toggle-the-damaged-video-statu.patch
PATCHFILES += 0236-0330-FE-Add-a-menu-to-Playbackbox-to-change-the-recording.patch

# 7.6.5 LVR safe patches related to mediamonitor
PATCHFILES += 0237-0069-MediaMonitor-doesn-t-handle-Jump-to-plugin-correctly.patch
PATCHFILES += 0238-0071-MediaMonitor-Delay-after-pmount-to-permit-proc-mount.patch
PATCHFILES += 0239-0072-MediaMonitor-Report-media-with-a-bitmask-of-media-ty.patch
PATCHFILES += 0240-0073-MediaMonitor-Make-list-of-registered-extensions-stat.patch
PATCHFILES += 0241-0074-MediaMon-Ensure-to-send-status-changed-after-disc-mo.patch
PATCHFILES += 0242-0075-MediaMon-Fix-verbose-string-arg.patch
PATCHFILES += 0243-0080-MythMusic-Raise-libcdio-logging-level-from-warnings-.patch
PATCHFILES += 0244-0132-MediaMonitor-Retry-mount-after-a-300mS-delay-if-init.patch
PATCHFILES += 0245-0139-MediaMon-Use-a-wait-condition-to-reduce-the-latency-.patch
PATCHFILES += 0246-0151-MediaMon-Don-t-announce-media-until-after-type-ident.patch
PATCHFILES += 0246-0179-MediaMon-Improve-CDROM-eject-robustness-with-SCSI-fa.patch
PATCHFILES += 0247-0180-MediaMon-Speed-up-recognition-and-autoplay-of-remove.patch
PATCHFILES += 0247-0200-MythMusic-Autoplay-music-files-on-removable-media.patch
PATCHFILES += 0249-0201-MediaMon-UI-to-select-preferred-media-handler.patch
PATCHFILES += 0250-0207-MediaMon-Fix-a-race-condition-between-MediaMonitor-C.patch
PATCHFILES += 0251-0278-MediaMon-Avoid-an-abort-in-libudf-when-a-data-CD-is-.patch
PATCHFILES += 0252-0279-MythMusic-Visualisers-only-disable-screensaver-if-sh.patch
PATCHFILES += 0253-0297-Mythmusic-Log-the-shoutcast-metadata-and-format-stri.patch

# 7.6.6 LVR safe patches related to DB caching
PATCHFILES += 0254-0105-DB-Load-all-dbase-settings-into-cache-at-startup.patch
PATCHFILES += 0255-0108-SG-Cache-storagegroup-records-in-FindDirs.patch
PATCHFILES += 0256-0110-TV-cache-videodisplayprofile-dbase-access.patch
PATCHFILES += 0257-0112-TV-Cache-playgroup-dbase-results.patch
PATCHFILES += 0259-0117-UI-Provide-dbase-cache-for-RegisterKey-and-RegisterJ.patch
PATCHFILES += 0260-0118-SimpleDBStorage-Where-possible-use-Get-SetSetting-to.patch
PATCHFILES += 0261-0119-FE-Omit-call-to-WriteDefaults-during-startup.patch
PATCHFILES += 0262-0144-DB-Update-settings-cache-in-SaveSettingOnHost.patch
PATCHFILES += 0263-0147-FE-Improve-caching-in-GuideGrid.patch
PATCHFILES += 0264-0089-TV-Automatically-select-a-free-card-when-changing-ch.patch
PATCHFILES += 0265-0091-TV-Find-alternative-channel-if-start-channel-is-not-.patch
PATCHFILES += 0266-0113-TV-Improved-caching-in-IsTunable.patch
PATCHFILES += 0267-0114-TV-RemoteIsTuneable-uses-ChannelUtil-GetMplexAndSour.patch
PATCHFILES += 0268-0115-Add-a-cache-to-RemoteIsTuneable.patch
PATCHFILES += 0269-0148-TV-Cache-the-last-sourceid-found-in-SourceUtil-GetSo.patch
PATCHFILES += 0270-0149-TV-Cache-the-last-groupname-found-in-ChannelGroup-Ge.patch
PATCHFILES += 0271-0138-MythWeather-Fix-a-SEGV-on-exit-from-setup-screen.patch
PATCHFILES += 0272-0185-MythWeather-Prevent-log-error-report-Widget-not-foun.patch

# 7.6.7 LVR safe patches for BE
PATCHFILES += 0273-0141-myth_system-Don-t-redirect-stdout-err-to-dev-null.patch
PATCHFILES += 0277-0202-FE-Fix-Display-MythDVD-menu-broken-when-MythDVD-plug.patch

ifeq ($(patsubst %private,private,$(shell cat ~/.minimyth/minimyth.conf.mk | grep "^mm_VERSION_MINIMYTH\s*?=" | sed -e "s/\s*//g")),private)
endif

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/cxx \
	db/mysql \
	lib/alsa-lib \
	lib/avahi \
	lib/exiv2 \
	lib/fftw3 \
	lib/freetype \
	lib/lame \
	lib/libass \
	lib/libavc1394 \
	lib/libcdio \
	lib/libiec61883 \
	lib/libxml2 \
	lib/openssl \
	lib/taglib \
	lib/zlib \
	python/python \
	python/python-MySQL-python \
	python/python-lxml \
	python/python-urlgrabber \
	qt/qt5 \
	system/lirc \
	system/udev \
	X11/libvdpau \
	xorg/xorg
BUILDDEPS = \
	devel/yasm \
	python/python-distutilscross \
	python/python-MySQL-python \
	python/python-lxml \
	python/python-urlgrabber


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
	--shlibdir="$(DESTDIR)$(libdir)" \
	--incdir="$(DESTDIR)$(includedir)/mythtv" \
	--mandir="$(DESTDIR)$(mandir)" \
	$(if $(filter -Os,$(CFLAGS)),--enable-small) \
	--cross-prefix="$(compiler_prefix)" \
	--enable-cross-compile \
	--sysroot="$(DESTDIR)$(rootdir)" \
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
	--host-libs="" \
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
	--disable-quartz-video \
	--disable-mac-bundle \
	--enable-libxml2 \
	--libxml2-path="$(DESTDIR)$(includedir)/libxml2" \
	--enable-libdns_sd \
	--enable-libcrypto \
	--without-bindings="perl" \
	--without-bindings="php" \
	--with-bindings="python" \
	--disable-mythlogserver

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

CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

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
	@sed -i -e "s/MYTH_SOURCE_VERSION.*/MYTH_SOURCE_VERSION \"$(MYTHTV_GIT_VERSION)-v`grep "^mm_VERSION_MINIMYTH" ~/.minimyth/minimyth.conf.mk | sed -e 's/.*\?=\s*\([0-9]*\.[0-9]*\).*/\1/'`\"/" $(WORKSRC)/mythtv/version.sh
	@sed -i -e "s/MYTH_SOURCE_PATH.*/MYTH_SOURCE_PATH \"$(mm_MYTH_VERSION)\"/" $(WORKSRC)/mythtv/version.sh
	@$(MAKECOOKIE)

#post-configure:
#	@sed -i -e "s/MYTH_SOURCE_VERSION.*/MYTH_SOURCE_VERSION \"$(MYTHTV_GIT_VERSION)-v`grep "^mm_VERSION_MINIMYTH" ~/.minimyth/minimyth.conf.mk | sed -e 's/.*\?=\s*\([0-9]*\.[0-9]*\).*/\1/'`\"/" $(WORKSRC)/mythtv/version.sh
#	@sed -i -e "s/MYTH_SOURCE_PATH.*/MYTH_SOURCE_PATH \"$(mm_MYTH_VERSION)\"/" $(WORKSRC)/mythtv/version.sh
#	@$(MAKECOOKIE)

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
