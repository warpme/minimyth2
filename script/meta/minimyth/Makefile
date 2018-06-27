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
	disk/hdparm \
	net/ifplugd \
	net/iputils \
	$(if $(filter i386 x86_64,$(GARCH_FAMILY)),system/irclient) \
	$(if $(filter i386 x86_64,$(GARCH_FAMILY)),system/irserver) \
	system/irxkeys \
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
	$(if $(filter intel, $(mm_GRAPHICS)),X11/intel-vaapi-driver) \
	$(if $(filter i386 x86_64,$(GARCH_FAMILY)),utils/intel-microcode2ucode) \
	utils/kmod \
	myth-$(mm_MYTH_VERSION)/mythtv \
	lib/ncursesw \
	net/nfs-utils \
	net/ntp \
	net/openssh \
	net/rpcbind \
	utils/pciutils \
	$(if $(filter perl,$(mm_SOFTWARE)), \
		perl/perl \
		perl/perl-MiniMyth) \
	utils/pmount \
	net/portmap \
	$(if $(filter i386 x86_64,$(GARCH_FAMILY)),system/powernowd) \
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
	utils/usbutils \
	system/eudev \
	lib/libgudev \
	X11/unclutter \
	utils/util-linux \
	utils/v4l-utils \
	utils/rsync \
	X11/libva \
	X11/libva-utils \
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
	X11/xdotool \
	system/zoneinfo \
	utils/htop \
	$(if $(filter nvidia,$(mm_GRAPHICS)), \
		nvidia/nvidia-$(mm_NVIDIA_VERSION)) \
	$(if $(filter nvidia-legacy,$(mm_GRAPHICS)), \
		nvidia/nvidia-$(mm_NVIDIA_LEGACY_VERSION)) \
	$(if $(filter mythplugins,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythplugins),myth-$(mm_MYTH_VERSION)/mythplugins) \
		$(if $(filter python,$(mm_SOFTWARE)), \
			python/python-lxml \
			python/python-future \
			python/python-requests-cache \
			python/python-MySQL-python \
			python/python-oauth \
			$(if $(filter i386 x86_64,$(GARCH_FAMILY)),python/python-IMAPClient) \
			python/python-pycurl) \
		perl/perl-Date-Manip \
		perl/perl-DateTime-Format-ISO8601 \
		perl/perl-Image-Size \
		perl/perl-Net-HTTP \
		$(if $(filter i386 x86_64-,$(GARCH_FAMILY)),perl/perl-PerlMagick) \
		perl/perl-SOAP-Lite \
		perl/perl-XML-Simple \
		perl/perl-XML-XPath \
		perl/perl-Date-Calc \
		perl/perl-TimeDate) \
	lib/dbus \
	lib/avahi \
	$(if $(filter fceu,$(mm_SOFTWARE)),emulators/fceu) \
	$(if $(filter jzintv,$(mm_SOFTWARE)),emulators/jzintv) \
	$(if $(filter mednafen,$(mm_SOFTWARE)),emulators/mednafen) \
	$(if $(filter stella,$(mm_SOFTWARE)),emulators/stella) \
	$(if $(filter mame,$(mm_SOFTWARE)),emulators/mame) \
	$(if $(filter visualboyadvance,$(mm_SOFTWARE)),emulators/VisualBoyAdvance) \
	$(if $(filter zsnes,$(mm_SOFTWARE)),emulators/zsnes) \
	$(if $(filter flash,$(mm_SOFTWARE)), \
		gtk/gtk3 \
		lib/nss) \
	$(if $(filter mc,$(mm_SOFTWARE)),utils/mc) \
	$(if $(filter dvdcss,$(mm_SOFTWARE)),lib/libdvdcss) \
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
	X11/xdotool \
	$(if $(filter chrome,$(mm_SOFTWARE)), \
		python/python-pylirc \
		python/python-pyalsaaudio \
		gtk/gconf \
		gtk/gtk3 \
		gtk/harfbuzz \
		lib/libcups \
		xorg/libxcomposite \
		xorg/libxkbcommon \
		xorg/libxscrnsaver \
		browsers/google-chrome) \
	$(if $(filter firefox,$(mm_SOFTWARE)), \
		python/python-pylirc \
		python/python-pyalsaaudio \
		gtk/gconf \
		gtk/gtk3 \
		lib/libcups \
		xorg/libxcomposite \
		xorg/libxkbcommon \
		xorg/libxscrnsaver \
		browsers/mozilla-firefox) \
	$(if $(filter lcdproc,$(mm_SOFTWARE)),system/lcdproc) \
	$(if $(filter ipxe,$(mm_SOFTWARE)),net/ipxe) \
	$(if $(filter debug,$(mm_SOFTWARE)), \
		devel/gdb \
		$(if $(filter i386 x86_64,$(GARCH_FAMILY)),devel/strace)) \
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
