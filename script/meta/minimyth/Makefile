
GARNAME    = minimyth
GARVERSION = $(mm_VERSION)
CATEGORIES = meta
LICENSE    = minimyth
DISTFILES  = $(DISTNAME).tar.bz2
minimyth_LICENSE_TEXT = $(mm_HOME)/html/minimyth/license.txt

DESCRIPTION =
define BLURB
endef

MINIMYTHIMG = main

DESTIMG = $(MINIMYTHIMG)

DEPENDS = \
	system/acpid \
	system/acpitool \
	utils/alsa-utils \
	utils/busybox \
	data/ca-bundle.crt \
	net/curl \
	disk/e2fsprogs \
	utils/ethtool \
	utils/evtest \
	devel/glibc-locale \
	disk/hdparm \
	net/ifplugd \
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
	$(if $(filter intel, $(mm_GRAPHICS)), \
		X11/intel-media-driver \
		X11/intel-vaapi-driver) \
	$(if $(filter i386 x86_64,$(GARCH_FAMILY)),utils/intel-microcode2ucode) \
	utils/kmod \
	$(if $(filter nvidia,$(mm_GRAPHICS)), \
		nvidia/nvidia-$(mm_NVIDIA_VERSION)) \
	$(if $(filter nvidia-legacy,$(mm_GRAPHICS)), \
		nvidia/nvidia-$(mm_NVIDIA_LEGACY_VERSION)) \
	X11/libva \
	myth-$(mm_MYTH_VERSION)/mythtv \
	lib/ncursesw \
	net/nfs-utils \
	net/openssh \
	net/rpcbind \
	utils/pciutils \
	$(if $(filter perl,$(mm_SOFTWARE)), \
		perl/perl \
		perl/perl-MiniMyth) \
	utils/pmount \
	utils/procps \
	$(if $(filter python2,$(mm_SOFTWARE)), \
		python2/python \
		python2/python-argparse \
		python2/python-tzupdate \
		python2/python-pylirc) \
	$(if $(filter python3,$(mm_SOFTWARE)), \
		python3/python \
		python3/python-argparse \
		python3/python-tzupdate \
		python3/python-pylirc) \
	X11/blackbox \
	utils/regionset \
	X11/rxvt \
	utils/SDL-Test \
	system/splashutils \
	utils/squashfs \
	system/sysvinit \
	utils/usbutils \
	system/eudev \
	lib/libgudev \
	X11/unclutter \
	utils/util-linux \
	utils/v4l-utils \
	utils/rsync \
	X11/libva-utils \
	X11/vdpauinfo \
	net/wakelan \
	net/netpipes \
	net/netperf \
	X11/xbindkeys \
	X11/xmacro \
	xorg/xorg \
	X11/xvattr \
	X11/xdotool \
	X11/x11vnc \
	system/zoneinfo \
	utils/htop \
	utils/bashtop \
	utils/findutils \
	$(if $(filter mesa mesa-git lima,$(mm_OPENGL_PROVIDER)),opengl/mesa-demos) \
	$(if $(filter mythplugins,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythplugins),myth-$(mm_MYTH_VERSION)/mythplugins) \
		$(if $(filter python2,$(mm_SOFTWARE)), \
			python2/python-IMAPClient \
			python2/python-pycurl) \
		$(if $(filter python3,$(mm_SOFTWARE)), \
			python3/python-IMAPClient \
			python3/python-pycurl) \
		perl/perl-Net-HTTP \
		perl/perl-Shell \
		perl/perl-Switch) \
		lib/libdiscid \
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
	lib/libinput \
	net/iputils \
	net/ntp \
	net/cifs-utils \
	net/iwd \
	utils/alsacap \
	utils/alsa-ucm2 \
	$(if $(filter mplayer-svn,$(mm_SOFTWARE)), \
		mediaplayers/mplayer-svn) \
	$(if $(filter ffmpeg-drm,$(mm_SOFTWARE)), \
		mediaplayers/ffmpeg-drm) \
	$(if $(filter mpv,$(mm_SOFTWARE)), \
		mediaplayers/mpv) \
	$(if $(filter kodi,$(mm_SOFTWARE)), \
		mediaplayers/kodi \
		mediaplayers/kodi-addon-pvr.mythtv) \
	$(if $(filter udisks1,$(mm_SOFTWARE)), \
		disk/udisks) \
	$(if $(filter udisks2,$(mm_SOFTWARE)), \
		disk/udisks2) \
	$(if $(filter voip,$(mm_SOFTWARE)), \
		lib/libpjsip) \
	$(if $(filter makemkv,$(mm_SOFTWARE)), \
		utils/makemkv-oss \
		utils/makemkv-bin) \
	$(if $(filter bumblebee,$(mm_SOFTWARE)), \
		system/bumblebee \
		system/bbswitch) \
	$(if $(filter sway,$(mm_SOFTWARE)), \
		wayland/sway) \
	$(if $(filter weston,$(mm_SOFTWARE)), \
		wayland/weston) \
	X11/xdotool \
	utils/tinymembench \
	utils/inxi \
	utils/peekpoke \
	utils/kbd \
	utils/dash \
	utils/read-edid \
	devel/gdb \
	$(if $(filter chrome,$(mm_SOFTWARE)), \
		gtk/gconf \
		gtk/gtk3 \
		gtk/harfbuzz \
		lib/libcups \
		xorg/libxcomposite \
		xorg/libxkbcommon \
		xorg/libxscrnsaver \
		browsers/google-chrome) \
	$(if $(filter firefox,$(mm_SOFTWARE)), \
		gtk/gconf \
		gtk/gtk3 \
		lib/libcups \
		xorg/libxcomposite \
		xorg/libxkbcommon \
		xorg/libxscrnsaver \
		browsers/mozilla-firefox) \
	$(if $(filter lcdproc,$(mm_SOFTWARE)),system/lcdproc) \
	$(if $(filter ipxe,$(mm_SOFTWARE)),bootloaders/ipxe) \
	$(if $(filter bootloader,$(mm_SOFTWARE)),bootloaders/bootloader) \
	$(if $(filter connman,$(mm_SOFTWARE)),net/connman) \
	$(if $(filter debug,$(mm_SOFTWARE)), \
		devel/apitrace \
		devel/valgrind \
		$(if $(filter i386 x86_64,$(GARCH_FAMILY)),devel/strace)) \
	$(if $(filter apitrace,$(mm_SOFTWARE)),devel/apitrace) \
	$(if $(filter gdb,$(mm_SOFTWARE)),devel/gdb) \
	$(if $(filter valgrind,$(mm_SOFTWARE)),devel/valgrind) \
	$(if $(filter libgpiod,$(mm_SOFTWARE)), \
		system/libgpiod \
		python3/python-libgpiod) \
	$(if $(filter xscreensaver,$(mm_SOFTWARE)),X11/xscreensaver) \
	$(if $(filter monitorix,$(mm_SOFTWARE)),utils/monitorix) \
	$(if $(filter termbin,$(mm_SOFTWARE)),utils/termbin) \
	$(if $(filter openvfd,$(mm_SOFTWARE)),utils/openvfd-service) \
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
	perl/perlstrip \
	devel/meson \
	net/inetutils \

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

reinstall-new-board:
	@echo " ==> Cleaning bootloaders ..."
	@$(MAKE) -C ../../bootloaders/bootloader clean-bootloader
	@echo " ==> Building bootloaders for current boards ..."
	@$(MAKE) -C ../../bootloaders/bootloader install
	@echo " ==> Rebuilding and Reinstalling image ..."
	@$(MAKE) rebuild reinstall

rebuild-kernel:
	@echo " ==> Cleaning kernel ..."
	@$(MAKE) -C ../../kernel/kernel clean clean-all
	@echo " ==> Rebuilding and Reinstalling image ..."
	@$(MAKE) clean install

rebuild-mythtv:
	@echo " ==> Cleaning mythtv ..."
	@$(MAKE) -C ../../myth/mythtv clean clean-all
	@echo " ==> Rebuilding and Reinstalling image ..."
	@$(MAKE) clean install

rebuild-mesa:
	@echo " ==> Cleaning mesa and mesa-git ..."
	@$(MAKE) -C ../../opengl/mesa clean clean-all
	@$(MAKE) -C ../../opengl/mesa-git clean clean-all
	@echo " ==> Rebuilding mesa ..."
	@$(MAKE) -C ../../opengl/opengl clean install
	@echo " ==> Rebuilding and Reinstalling image ..."
	@$(MAKE) clean install
