
GARNAME      = lirc
GARVERSION   = 0.10.2
CATEGORIES   = system
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/LIRC/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c kernel/kernel lib/alsa-lib lib/libftdi lib/libirman lib/libusb-compat xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--with-x \
	SH_PATH="/bin/sh" \
	DEVINPUT_HEADER="$(DESTDIR)$(includedir)/linux/input.h" \

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk
include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(GARVERSION), $(DISTNAME))
	@$(MAKECOOKIE)

x-checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/accent.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/alsa_usb.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/atilibusb.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/atwf83.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/audio_alsa.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/audio.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/awlibusb.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/bte.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/commandir.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/creative_infracd.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/creative.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/default.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/devinput.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/dfclibusb.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/dsp.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/ea65.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/file.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/girs.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/hiddev.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/i2cuser.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/irlink.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/irtoy.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/livedrive_midi.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/livedrive_seq.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/logitech.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/mouseremote.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/mp3anywhere.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/mplay.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/pcmak.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/pinsys.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/pixelview.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/silitek.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/slinke.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/srm7500libusb.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/tira.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/udp.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/uirt2.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/uirt2_raw.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/usbx.la
	@rm -f $(DESTDIR)$(libdir)/lirc/plugins/zotac.la
	@rm -f $(DESTDIR)$(libdir)/libirrecord.la
	@rm -f $(DESTDIR)$(libdir)/liblirc_client.la
	@rm -f $(DESTDIR)$(libdir)/liblirc.la
	@rm -f $(DESTDIR)$(libdir)/liblirc_driver.la
	@$(DESTDIR)$(bindir)/lirc-make-devinput $(DESTDIR)$(includedir)/linux/input-event-codes.h > $(DESTDIR)$(sysconfdir)/lirc/lircd.conf.d/lircd.devinput
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@# 0.9.1/0.9.1 clean
	@rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/misc/lirc
	@rm -rf $(DESTDIR)$(bindir)/lircrcd
	@rm -rf $(DESTDIR)$(sbindir)/lircd
	@rm -rf $(DESTDIR)$(sbindir)/lircmd
	@rm -rf $(DESTDIR)$(includedir)/lirc
	@rm -rf $(DESTDIR)$(libdir)/liblirc_client.*
	@rm -rf $(DESTDIR)$(mandir)/man1/lircrcd.1
	@rm -rf $(DESTDIR)$(mandir)/man8/lircd.8
	@rm -rf $(DESTDIR)$(mandir)/man8/lircmd.8
	@# 0.9.4 clean
	@rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/misc/lirc
	@rm -rf $(DESTDIR)$(bindir)/lircrcd
	@rm -rf $(DESTDIR)$(bindir)/lirc-config-tool
	@rm -rf $(DESTDIR)$(bindir)/lirc-lsremotes
	@rm -rf $(DESTDIR)$(bindir)/lirc-make-devinput
	@rm -rf $(DESTDIR)$(bindir)/lircrcd
	@rm -rf $(DESTDIR)$(bindir)/lirc-setup
	@rm -rf $(DESTDIR)$(bindir)/ircat
	@rm -rf $(DESTDIR)$(bindir)/irdb-get
	@rm -rf $(DESTDIR)$(bindir)/irexec
	@rm -rf $(DESTDIR)$(bindir)/irpipe
	@rm -rf $(DESTDIR)$(bindir)/irpty
	@rm -rf $(DESTDIR)$(bindir)/irrecord
	@rm -rf $(DESTDIR)$(bindir)/irsend
	@rm -rf $(DESTDIR)$(bindir)/irsimreceive
	@rm -rf $(DESTDIR)$(bindir)/irsimsend
	@rm -rf $(DESTDIR)$(bindir)/irtestcase
	@rm -rf $(DESTDIR)$(bindir)/irw
	@rm -rf $(DESTDIR)$(bindir)/irxevent
	@rm -rf $(DESTDIR)$(bindir)/irtext2udp
	@rm -rf $(DESTDIR)$(bindir)/mode2
	@rm -rf $(DESTDIR)$(bindir)/pronto2lirc
	@rm -rf $(DESTDIR)$(bindir)/xmode2
	@rm -rf $(DESTDIR)$(sbindir)/lircd
	@rm -rf $(DESTDIR)$(sbindir)/lircd-setup
	@rm -rf $(DESTDIR)$(sbindir)/lircd-uinput
	@rm -rf $(DESTDIR)$(sbindir)/lirc-lsplugins
	@rm -rf $(DESTDIR)$(sbindir)/lircmd
	@rm -rf $(DESTDIR)$(includedir)/lirc
	@rm -rf $(DESTDIR)$(libdir)/liblirc_client.*
	@rm -rf $(DESTDIR)$(libdir)/liblirc*
	@rm -rf $(DESTDIR)$(libdir)/lirc*
	@rm -rf $(DESTDIR)$(libdir)/libirrecord*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/lirc*
	@rm -rf $(DESTDIR)$(libdir)/python2.6/site-packages/lirc*
	@rm -rf $(DESTDIR)$(libdir)/python3.5/site-packages/lirc*
	@rm -rf $(DESTDIR)$(mandir)/man1/lircrcd.1
	@rm -rf $(DESTDIR)$(mandir)/man8/lircd.8
	@rm -rf $(DESTDIR)$(mandir)/man8/lircmd.8
	@rm -rf $(DESTDIR)$(datadir)/lirc*

