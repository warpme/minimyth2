
GARNAME      = udisks
GARVERSION   = 2.9.4
CATEGORIES   = lib
MASTER_SITES = https://github.com/storaged-project/udisks/archive/
DISTFILES    = udisks-$(GARVERSION).tar.gz org.freedesktop.UDisks2.conf
WORKSRC      = $(WORKDIR)/udisks-$(DISTNAME)
PATCHFILES   = \
	$(DISTNAME)-disable-gobject-introspection.patch \
	$(DISTNAME)-remove-intl-and-gtk-doc.patch \

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/polkit lib/libgudev lib/libblockdev lib/libatasmart
# gtk/gobject-introspection not added here as cross-compile is not yet addressed in mm2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--disable-man \
	--enable-daemon \
	--enable-fhs-media \
	--disable-acl \
	--disable-lvm2 \
	--disable-lvmcache \
	--disable-iscsi \
	--disable-btrfs \
	--disable-zram \
	--disable-lsm \
	--disable-bcache \
	--disable-vdo \

include ../../gar.mk

pre-configure:
	@$(MAKE) clean clean-all -C ../udisks
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@mkdir -p $(DESTDIR)$(sysconfdir)/dbus-1/system.d
	@cp -f $(WORKDIR)/org.freedesktop.UDisks2.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/org.freedesktop.UDisks2.conf
	@rm -f $(DESTDIR)$(libdir)/libudisks2.la
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(sbindir)/umount.udisks2
	@rm -rf $(DESTDIR)$(bindir)/udisksctl
	@rm -rf $(DESTDIR)$(libexecdir)/udisks2*
	@rm -rf $(DESTDIR)$(libdir)/libudisks2*
	@rm -rf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/org.freedesktop.UDisks2.conf
	@rm -rf $(DESTDIR)$(sysconfdir)/udisks2*
	@rm -rf $(DESTDIR)$(includedir)/udisks2*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/udisks2.pc
	@rm -rf $(DESTDIR)$(datadir)/pkgconfig/udisks2.pc
	@rm -rf $(DESTDIR)$(datadir)/bash-completion/completions/udisksctl
	@rm -rf $(DESTDIR)$(datadir)/dbus-1/system-services/org.freedesktop.UDisks2.service
