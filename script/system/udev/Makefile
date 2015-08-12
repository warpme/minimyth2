GARNAME = udev
GARVERSION = 182
CATEGORIES = system
MASTER_SITES = ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c gtk/glib lib/libxslt utils/kmod utils/pciutils utils/usbutils utils/util-linux
BUILDDEPS = utils/gperf

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--disable-debug \
	--enable-logging \
	--enable-manpages \
	--enable-gudev \
	--disable-introspection \
	--disable-keymap \
	--disable-rule_generator \
	--disable-floppy \
	--disable-action_modeswitch \
	--with-gnu-ld \
	--with-rootprefix=$(rootdir) \
	--with-rootlibdir=$(libdir) \
	--without-selinux \
	--with-usb-ids-path=$(datadir)/usb.ids \
	--with-pci-ids-path=$(datadir)/pci.ids \
	--with-firmware-path=$(elibdir)/firmware \
	--without-systemdsystemunitdir

include ../../gar.mk

libexecdir := $(libdir)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

pre-install:
	@rm -rf $(DESTDIR)$(sysconfdir)/udev
	@rm -rf $(DESTDIR)$(bindir)/udevadm
	@rm -rf $(DESTDIR)$(libdir)/libudev.*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libudev.pc
	@rm -rf $(DESTDIR)$(libexecdir)/udev
	@rm -rf $(DESTDIR)$(licensedir)/udev
	@rm -rf $(DESTDIR)$(versiondir)/udev
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libudev.la
	@rm -rf $(DESTDIR)$(libdir)/libgudev-1.0.la
	@$(MAKECOOKIE)
