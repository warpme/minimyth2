GARNAME = lirc
GARVERSION = 0.9.0
CATEGORIES = system
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/LIRC/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-kernel_err.patch \
	$(DISTNAME)-lirc_xbox.patch \
	$(DISTNAME)-disable_lirc_i2c.patch \
	$(DISTNAME)-remove_smp_lock_h.patch \
	$(DISTNAME)-bit_le_fix.patch \
	$(DISTNAME)-kfifo_fix.patch \
	$(DISTNAME)-uinput_key_fix.patch \
	$(DISTNAME)-input_map.patch.gar \
	$(DISTNAME)-remove_asm_sytem_h.patch \
	$(DISTNAME)-kernel3.8.13-build.patch \
	$(DISTNAME)-fix_for_new_automake.patch \
	$(DISTNAME)-kernel3.19.1-build.patch
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
	--enable-sandboxed \
	--with-gnu-ld \
	--with-x \
	--with-kerneldir="$(DESTDIR)$(LINUX_SOURCEDIR)" \
	--with-moduledir="$(LINUX_MODULESDIR)/misc/lirc" \
	--with-driver=all \
	--with-transmitter \
	--with-syslog
BUILD_ARGS     = $(LINUX_MAKE_ARGS)
INSTALL_ARGS   = $(LINUX_MAKE_ARGS)

CONFIGURE_ENV = $(LINUX_MAKE_ENV)
BUILD_ENV     = $(LINUX_MAKE_ENV)
INSTALL_ENV   = $(LINUX_MAKE_ENV)

GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk
include ../../gar.mk

PARALLELMFLAGS := -j1

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(GARVERSION), $(DISTNAME))
	@$(MAKECOOKIE)

x-checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/liblirc_client.la
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/misc/lirc
	@rm -rf $(DESTDIR)$(bindir)/lircrcd
	@rm -rf $(DESTDIR)$(sbindir)/lircd
	@rm -rf $(DESTDIR)$(sbindir)/lircmd
	@rm -rf $(DESTDIR)$(includedir)/lirc
	@rm -rf $(DESTDIR)$(libdir)/liblirc_client.*
	@rm -rf $(DESTDIR)$(mandir)/man1/lircrcd.1
	@rm -rf $(DESTDIR)$(mandir)/man8/lircd.8
	@rm -rf $(DESTDIR)$(mandir)/man8/lircmd.8
