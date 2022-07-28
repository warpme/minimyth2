
GARNAME      = udisks
GARVERSION   = 1.0.4
CATEGORIES   = lib
MASTER_SITES = http://hal.freedesktop.org/releases/
DISTFILES    = $(DISTNAME).tar.gz org.freedesktop.UDisks.conf
PATCHFILES   = \
    $(DISTNAME)-automake_1.13.patch \
    $(DISTNAME)-fix-gcc9.3-building.patch \

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/sg3_utils gtk/dbus-glib lib/polkit lib/pam disk/parted disk/LVM2 lib/libatasmart
BUILDDEP = gtk/dbus-glib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-lvm2 \
	--disable-man-pages \
	--disable-remote-access \
	DEVMAPPER_CFLAGS="$(DESTDIR)$(includedir)" \
	DEVMAPPER_LIBS="$(DESTDIR)$(libdir)/libdevmapper.so"

include ../../gar.mk

pre-configure:
	@$(MAKE) clean clean-all -C ../udisks2
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@rm -f $(WORKSRC)/config.cache
	@$(MAKECOOKIE)

post-install:
	@mkdir -p $(DESTDIR)$(sysconfdir)/dbus-1/system.d
	@cp -f $(WORKDIR)/org.freedesktop.UDisks.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/org.freedesktop.UDisks.conf
	@rm -f $(DESTDIR)$(libdir)/libdbus-1.la
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(bindir)/udisks
	@rm -rf $(DESTDIR)$(bindir)/umount.udisks
	@rm -rf $(DESTDIR)$(libexecdir)/udisks-helper-*
	@rm -rf $(DESTDIR)$(libexecdir)/udisks-daemon
	@rm -rf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/org.freedesktop.UDisks.conf
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/udisks.pc
	@rm -rf $(DESTDIR)$(elibdir)/udev/udisks*
	@rm -rf $(DESTDIR)$(elibdir)/udev/rules.d/80-udisks.rules
	@rm -rf $(DESTDIR)$(datadir)/pkgconfig/udisks.pc
	@rm -rf $(DESTDIR)$(datadir)/dbus-1/system-services/org.freedesktop.UDisks.service
