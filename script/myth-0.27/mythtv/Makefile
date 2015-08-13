GARNAME = mythtv
GARVERSION = $(MYTHTV_VERSION)
CATEGORIES = $(CATEGORY)
MASTER_SITES = svn://svn.mythtv.org/svn/trunk/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  =

PATCHFILES += 0660-commit-bcf888f-subtitles-Fix-automatic-display-of-captions-subtitles.patch
PATCHFILES += 0661-commit-e4c6d16-Dont-show-the-miniplayer-in-MythMusic-when-starting-the-next.patch
PATCHFILES += 0662-commit-65ada0c-Spawn-MythFrontend-from-separate-thread-in-MythWelcome.patch
PATCHFILES += 0662-commit-7860e91-Network-control-Handle-space-key-properly.patch
PATCHFILES += 0663-commit-554046a-Subtitles-Dont-reset-subtitle-state-after-seeking.patch

# 7.6.13
PATCHFILES += 0664-commit-bcdaa88-Subtitles-Allow-transitions-between-ATSC-and-SCTE-ca.patch
PATCHFILES += 0665-commit-74dba35-Subtitles-Fix-state-calculation-in-EnableCaptions-Di.patch
PATCHFILES += 0666-commit-7962008-Subtitles-Yet-another-state-calculation-fix.patch
PATCHFILES += 0668-commit-974d1ae-Reduce-Watch-Recordings-sluggishness-by-caching-jobq.patch
PATCHFILES += 0669-commit-a848edd-Video-output-Add-default-fragment-shader-for-OpenGL-.patch
PATCHFILES += 0670-commit-8b6d4da-Video-output-Fix-OpenGL-1-output-after-b9971146.patch
PATCHFILES += 0671-commit-45d2d51-Subtitles-Fix-cc608-preamble-indents.-Fixes-12051.patch
PATCHFILES += 0672-commit-6b73976-MythDownloadManager-add-some-logging-to-try-to-track.patch
PATCHFILES += 0673-commit-e7af3a0-MythDownloadManager-put-the-lock-around-m_downloadIn.patch
PATCHFILES += 0674-commit-8fd277b-MythDownloadManager-fix-a-bug-when-downloading-URL-s.patch
PATCHFILES += 0675-commit-26bb9cb-Internet-Content-Adapt-the-YouTube-grabber-to-the-v3.patch
PATCHFILES += 0676-commit-2142e08-Internet-Content-Tidy-up-some-formatting-in-the-YouT.patch
PATCHFILES += 0677-commit-9498257-Internet-Content-Replace-precompiled-vimeo_data.pyc-.patch

ifeq ($(patsubst %private,private,$(shell cat ~/.minimyth/minimyth.conf.mk | grep "^mm_VERSION_MINIMYTH\s*?=" | sed -e "s/\s*//g")),private)
    PATCHFILES += 1000-1138-mythmusic-backport-from-master-20140505.patch
    PATCHFILES += 1139-backport-03d2e69-MusicCommon-Only-connect-the-Exiting-signal-if-the-n.patch
    PATCHFILES += 1140-backport-b3c52ec-MytghMusic-check-a-dynamic_cast-in-PlaylistEditorVie.patch
    PATCHFILES += 1141-backport-050358a-MusicCommon-remove-some-dead-code-from-switchView.patch
    # v 6.7.05
    PATCHFILES += 1142-backport-6ddc2e5-MythMusic-Avoid-a-floating-point-domain-error-in-the.patch
    PATCHFILES += 1143-backport-0022b23-MythMusic-Read-Set-an-annonymous-POPM-tag-in-ID3-tag.patch
    PATCHFILES += 1144-backport-491fd8f-MythMusic-Save-the-last-play-date-time-in-the-ID3-ta.patch
    PATCHFILES += 1145-backport-b639056-MythMusic-If-the-global-POPM-tag-playcount-was-zero-.patch
    # 6.9.01
    PATCHFILES += 1146-backport-31614bf-MusicPlayer-On-stop-clear-any-temporary-one-shot-met.patch

    PATCHFILES += 2038-2284-mythimage-backport-from-master-20140505.patch
    PATCHFILES += 2285-backport-812bdb6-cppcheck-Invalid-usleep-argument.-The-value-is-10000.patch
    PATCHFILES += 2286-backport-c298851-New-Gallery-Use-the-master-hostname-to-generate-the-.patch
    PATCHFILES += 2287-New-Image-Gallery-Add-default-theme-definition.patch
    PATCHFILES += 2288-New-Image-Gallery-Remove-unused-m_selectedImage-from.patch
    PATCHFILES += 2289-New-Image-Gallery-Fix-initial-zoom.patch
    PATCHFILES += 2290-New-Image-Gallery-Fix-segfault-from-using-INFO-on-Sl.patch
    PATCHFILES += 2291-New-Image-Gallery-Restore-failed-transform-correctly.patch
    PATCHFILES += 2292-New-Image-Gallery-Fix-dir-file-counts.patch
    PATCHFILES += 2293-New-Image-Gallery-Fix-folder-thumbnails.patch
    PATCHFILES += 2294-New-Image-Gallery-Prevent-unnecessary-refreshes.patch
    PATCHFILES += 2295-New-Image-Gallery-Add-logging.patch
    PATCHFILES += 2296-New-Image-Gallery-Fix-rotate-flip.patch
    PATCHFILES += 2297-New-Image-Gallery-Fix-info-display.patch
    PATCHFILES += 2298-backport-92c7377-New-Image-gallery-Fix-exif-updates.patch

    PATCHFILES += 3000-backport-ec5a9d3-MythNetvision-pass-const-QStrings-by-reference-cppch.patch
    # PATCHFILES += 3002-backport-85b2d6d-Reorganize-cache-and-temporary-directories-under-com.patch
    PATCHFILES += 3004-backport-72bb682-MythNetvision-Move-common-stuff-to-base-classes.patch
    PATCHFILES += 3005-backport-7caf30a-MythNetvision-Fix-some-cppcheck-warnings.patch
    PATCHFILES += 3006-backport-103a135-MythNetvision-Fix-some-issues-found-by-Coverity.patch
    PATCHFILES += 3007-backport-c91e763-MythNetvision-Rename-various-methods.patch
    PATCHFILES += 3008-backport-998efae-MythNetvision-Remove-one-member-in-NetTree.patch
    PATCHFILES += 3009-backport-81ac340-MythNetvision-Whitespace-cleanup.patch
    PATCHFILES += 3010-backport-fabc464-MythNetvision-Fix-thumbnail-loading-in-the-list-view.patch
    PATCHFILES += 3011-backport-c7cb70b-MythNetvision-Simplify-busy-dialog-handling.patch
    PATCHFILES += 3012-backport-67407b3-MythNetvision-Set-progress-dialog-to-NULL-after-clos.patch
    PATCHFILES += 3013-backport-717b39c-MythNetvision-Split-NetTree-SlotItemChanged-into-sep.patch
    PATCHFILES += 3014-backport-8eb969e-MythNetvision-Set-childcount-and-other-text-fields-i.patch
    PATCHFILES += 3015-backport-64e589e-MythNetvision-Focus-the-search-results-after-a-searc.patch
    PATCHFILES += 3016-backport-220ee25-MythNetvision-Update-thumbnail-and-text-when-switchi.patch
    PATCHFILES += 3017-backport-aa9066f-MythNetVision-NULL-check-item-in-NetSearch-customEve.patch

    # 6.9.04
    PATCHFILES += 0571-backport-1b22056-SendReceiveStringList-handle-the-UNKNOWN_COMMAND-res.patch 
    PATCHFILES += 0572-backport-124a55d-MainServer-send-an-ERROR-response-back-for-malformed.patch

    # 6.9.13
    #PATCHFILES += 0586-backport-78d50ba-UPnP-Have-the-UPnP-server-use-ServerPool-DefaultList.patch
    #PATCHFILES += 0587-backport-a865015-UPnP-Music-Add-some-information-derived-from-the-mim.patch
    #PATCHFILES += 0588-backport-b3e1e21-UPnP-Remove-extraneous-colon-which-slipped-into-the-.patch

    # 6.9.05
    PATCHFILES += 1147-backport-654a4b2-remotefile-Use-more-accurate-MythCoreContext-IsThisH.patch
    PATCHFILES += 1148-backport-be87ab8-corecontext-Add-IsThisBackend-API.patch
    PATCHFILES += 1149-backport-ef8694a-remotefile-use-IsThisBackend-API.patch
    PATCHFILES += 1150-backport-411272f-RemoteFile-add-some-additional-logging-to-CopyFile.patch
    PATCHFILES += 1151-backport-1dab190-MainServer-add-a-QUERY_FINDFILE-command-to-the-proto.patch
    PATCHFILES += 1152-backport-7856014-RemoteFile-add-FindFileList-which-uses-the-new-QUERY.patch
    PATCHFILES += 1153-backport-9c18ef0-MythMusic-update-findIcon-to-use-a-regexp-to-find-th.patch
    PATCHFILES += 1154-backport-3902c31-MainServer-use-gCoreContext-IsThisHost-hostname-to-c.patch
    PATCHFILES += 1155-backport-b4dfae9-MythMusic-fix-playback-of-tracks-with-an-in-the-file.patch
    # 6.12.3
    PATCHFILES += 1156-backport-4c56125-MythMusic-Fix-out-of-bounds-array-access-in-spectrum.patch

    # 6.12.4
    PATCHFILES += 1157-backport-16de09f-MythMusic-Add-a-simple-ASX-playlist-parser.patch
    PATCHFILES += 1159-backport-af9e316-Fix-FindFile-FindFileLists-using-SendRecieveStringLi.patch
    PATCHFILES += 1160-backport-cb54c9c-More-accurate-error-message-when-an-IP-is-passed-to-.patch
    PATCHFILES += 1162-428609b-MythMusic-Fix-smart-playlists-uses-lastplay-or-date_.patch
    PATCHFILES += 1163-e5d6a42-MythMusic-Fix-sql-error-in-SmartPlaylist-editor-when.patch
    PATCHFILES += 1164-43b799a-MythMusic-Fix-NULL-insert-into-NOT-NULL-column-in-Sm.patch
    PATCHFILES += 1165-2f3f422-MythMusic-Allow-smart-playlist-to-be-saved-even-if-i.patch
    PATCHFILES += 1166-7fca780-MythMusic-Fix-another-NULL-insert-into-NOT-NULL-colu.patch
    PATCHFILES += 1167-backport-5447a50-MythMusic-fix-a-possible-crash-after-scanning-for-mu.patch

    # 6.14.3
    PATCHFILES += 1168-backport-7df5f59-Add-additional-indexes-to-the-music-tables.patch
    PATCHFILES += 1169-backport-37f67e4-MythMusic-use-the-avfdecoder-for-everything-except-f.patch
    PATCHFILES += 1170-backport-54a8baa-MythMusic-wait-for-all-music-and-playlists-to-load-i.patch

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
	qt/qt4 \
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
	--qmake="$(DESTDIR)$(qt4bindir)/qmake" \
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

post-configure:
	@sed -i -e "s/MYTH_SOURCE_VERSION.*/MYTH_SOURCE_VERSION \"$(MYTHTV_GIT_VERSION)-v`grep "^mm_VERSION_MINIMYTH" ~/.minimyth/minimyth.conf.mk | sed -e 's/.*\?=\s*\([0-9]*\.[0-9]*\.[0-9]*\).*/\1/'`\"/" $(WORKSRC)/mythtv/version.sh
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
