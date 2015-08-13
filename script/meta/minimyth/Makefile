GARNAME = minimyth
GARVERSION = $(mm_VERSION)
CATEGORIES = meta
LICENSE = minimyth
DISTFILES = $(DISTNAME).tar.bz2
minimyth_LICENSE_TEXT = $(mm_HOME)/html/minimyth/license.txt

DESCRIPTION =
define BLURB
endef

MINIMYTHIMG = main

DESTIMG = $(MINIMYTHIMG)

DEPENDS = \
	system/acpid \
	utils/alsa-utils \
	utils/busybox \
	data/ca-bundle.crt \
	net/curl \
	disk/e2fsprogs \
	disk/eject \
	utils/ethtool \
	utils/evtest \
	devel/fakeroot \
	devel/glibc-locale \
	net/ipxe \
	disk/hdparm \
	net/ifplugd \
	net/iputils \
	system/irclient \
	system/irserver \
	system/irxkeys \
	system/lcdproc \
	net/lighttpd \
	system/kbdd \
	kernel/kernel \
	fonts/dejavu-fonts \
	fonts/liberation-fonts \
	system/lirc \
	system/eventlircd \
	utils/lm_sensors \
	utils/lsdvd \
	utils/lsof \
	X11/libva-intel-driver \
	X11/libva-vdpau-driver \
	utils/intel-microcode2ucode \
	utils/kmod \
	myth-$(mm_MYTH_VERSION)/mythtv \
	lib/ncursesw \
	net/nfs-utils \
	net/ntp \
	net/openssh \
	net/rpcbind \
	utils/pciutils \
	perl/perl \
	perl/perl-Class-Inspector \
	perl/perl-Date-Manip \
	perl/perl-Lchown \
	perl/perl-MiniMyth \
	perl/perl-RFLibs \
	perl/perl-Regexp-Wildcards \
	perl/perl-HTTP-Message \
	perl/perl-HTTP-Date \
	perl/perl-Encode-Locale \
	utils/pmount \
	net/portmap \
	system/powernowd \
	utils/procps \
	python/python \
	python/python-argparse \
	python/python-tzupdate \
	X11/ratpoison \
	utils/regionset \
	X11/rxvt \
	utils/SDL-Test \
	system/splashutils \
	utils/squashfs \
	net/syslinux \
	system/sysvinit \
	system/udev \
	X11/unclutter \
	utils/usbutils \
	utils/util-linux \
	utils/v4l-utils \
	utils/rsync \
	X11/libva \
	X11/vdpauinfo \
	net/wakelan \
	net/netpipes \
	net/netperf \
	X11/x11vnc \
	X11/xbindkeys \
	X11/xmacro \
	xorg/xorg \
	X11/xscreensaver \
	X11/xvattr \
	system/zoneinfo \
	$(if $(filter nvidia,$(mm_GRAPHICS)), \
		nvidia/nvidia-$(mm_NVIDIA_VERSION)) \
	$(if $(filter mythbrowser,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythbrowser),myth-$(mm_MYTH_VERSION)/mythbrowser)) \
	$(if $(filter mythdvd,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythdvd),myth-$(mm_MYTH_VERSION)/mythdvd)) \
	$(if $(filter mythgallery,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythgallery),myth-$(mm_MYTH_VERSION)/mythgallery)) \
	$(if $(filter mythgame,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythgame),myth-$(mm_MYTH_VERSION)/mythgame) \
		emulators/fceu \
		emulators/jzintv \
		emulators/mednafen \
		emulators/stella \
		$(if $(filter mame,$(mm_SOFTWARE)),emulators/mame) \
		emulators/VisualBoyAdvance \
		$(if $(filter i386,$(mm_GARCH_FAMILY)),emulators/zsnes)) \
	$(if $(filter mythmusic,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythmusic),myth-$(mm_MYTH_VERSION)/mythmusic)) \
	$(if $(filter mythnetvision,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythnetvision),myth-$(mm_MYTH_VERSION)/mythnetvision) \
		$(if $(filter python,$(mm_SOFTWARE)), \
			python/python-lxml \
			python/python-MySQL-python \
			python/python-oauth \
			python/python-pycurl)) \
	$(if $(filter mythnews,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythnews),myth-$(mm_MYTH_VERSION)/mythnews)) \
	$(if $(filter mythphone,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythphone),myth-$(mm_MYTH_VERSION)/mythphone)) \
	$(if $(filter mythstream,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythstream),myth-$(mm_MYTH_VERSION)/mythstream) \
		perl/perl-HTML-Parser \
		perl/perl-libwww-perl \
		perl/perl-XML-DOM \
		perl/perl-XML-XQL) \
	$(if $(filter mythvideo,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythvideo),myth-$(mm_MYTH_VERSION)/mythvideo) \
		perl/perl-HTML-Parser \
		perl/perl-libwww-perl \
		perl/perl-URI \
		$(if $(filter python,$(mm_SOFTWARE)), \
			python/python-BeautifulSoup \
			python/python-IMDbPY \
			python/python-Imaging \
			python/python-MySQL-python)) \
	$(if $(filter mythweather,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythweather),myth-$(mm_MYTH_VERSION)/mythweather) \
		perl/perl-Date-Manip \
		perl/perl-DateTime-Format-ISO8601 \
		perl/perl-Image-Size \
		perl/perl-Net-HTTP \
		perl/perl-PerlMagick \
		perl/perl-SOAP-Lite \
		perl/perl-XML-Simple \
		perl/perl-XML-XPath \
		perl/perl-Date-Calc \
		perl/perl-TimeDate) \
	$(if $(filter mythzoneminder,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythzoneminder),myth-$(mm_MYTH_VERSION)/mythzoneminder)) \
	$(if $(filter mythplugins,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythplugins),myth-$(mm_MYTH_VERSION)/mythplugins) \
		emulators/fceu \
		emulators/jzintv \
		emulators/mednafen \
		emulators/stella \
		$(if $(filter mame,$(mm_SOFTWARE)),emulators/mame) \
		emulators/VisualBoyAdvance \
		$(if $(filter i386,$(mm_GARCH_FAMILY)),emulators/zsnes) \
		$(if $(filter python,$(mm_SOFTWARE)), \
			python/python-lxml \
			python/python-MySQL-python \
			python/python-oauth \
			python/python-pycurl) \
		perl/perl-Date-Manip \
		perl/perl-DateTime-Format-ISO8601 \
		perl/perl-Image-Size \
		perl/perl-Net-HTTP \
		perl/perl-PerlMagick \
		perl/perl-SOAP-Lite \
		perl/perl-XML-Simple \
		perl/perl-XML-XPath \
		perl/perl-Date-Calc \
		perl/perl-TimeDate) \
		lib/dbus \
		lib/avahi \
	$(if $(filter flash,$(mm_SOFTWARE)), \
		gtk/gtk \
		lib/nss) \
		utils/mc \
		lib/libdvdcss \
		lib/nss-mdns \
		net/mount.cifs \
	$(if $(filter gnash,$(mm_SOFTWARE)), \
		mediaplayers/gnash) \
	$(if $(filter mplayer,$(mm_SOFTWARE)), \
		mediaplayers/mplayer) \
	$(if $(filter mplayer-svn,$(mm_SOFTWARE)), \
		mediaplayers/mplayer-svn) \
	$(if $(filter vlc,$(mm_SOFTWARE)), \
		mediaplayers/vlc) \
	$(if $(filter xine,$(mm_SOFTWARE)), \
		mediaplayers/xine-ui) \
	$(if $(filter wiimote,$(mm_SOFTWARE)), \
		utils/cwiid) \
	$(if $(filter udisks,$(mm_SOFTWARE)), \
		lib/udisks) \
	$(if $(filter voip,$(mm_SOFTWARE)), \
		lib/libpjsip \
		python/python-pjsip) \
	$(if $(filter makemkv,$(mm_SOFTWARE)), \
		utils/makemkv-oss \
		utils/makemkv-bin) \
	$(if $(filter bumblebee,$(mm_SOFTWARE)), \
		system/bumblebee \
		system/bbswitch) \
	$(if $(filter debug,$(mm_SOFTWARE)), \
		devel/gdb \
		devel/strace) \
	$(filter-out %/Makefile extras/extras-% extras/extras.%,$(subst ../../,,$(wildcard ../../extras/*))) \
	$(mm_USER_PACKAGES)

BUILDDEPS = \
	utils/coreutils \
	devel/fakeroot \
	utils/file \
	utils/findutils \
	utils/module-init-tools \
	utils/squashfs \
	utils/tar \
	utils/util-linux \
	xorg/xorg \
	perl/perlstrip \
	python/python-pyminifier

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

pre-everything:
	@$(MAKE) -f files/check.mk DESTIMG=$(DESTIMG)
	@# There is no MAKECOOKIE so that this runs every time.

$(DOWNLOADDIR)/$(DISTNAME).tar.bz2:
	@if [ ! -e $(DOWNLOADDIR)/$(DISTNAME).tar.bz2 ] ; then \
		$(MAKE) -f files/distfile.mk DESTIMG=$(DESTIMG) ; \
	fi

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

$(GARCHIVEDIR)/$(DISTNAME).tar.bz2:
	@#

configure-custom:
	@$(MAKE) -f files/configure.mk DESTIMG=$(DESTIMG)
	@$(MAKECOOKIE)
