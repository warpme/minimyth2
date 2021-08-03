
GARNAME      = eudev
GARVERSION   = 3.2.10
CATEGORIES   = system
MASTER_SITES = https://github.com/gentoo/eudev/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c gtk/glib lib/libxslt utils/kmod utils/pciutils utils/util-linux
BUILDDEPS = utils/gperf gtk/glib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--disable-manpages \
	--disable-introspection \
	--disable-rule_generator \
	--enable-kmod \
	--enable-hwdb \
	--with-gnu-ld \
	--with-rootprefix=$(rootdir) \
	--with-rootlibdir=$(libdir) \
	--with-usb-ids-path=$(datadir)/usb.ids \
	--with-pci-ids-path=$(datadir)/pci.ids \
	--with-firmware-path=$(elibdir)/firmware \
	--disable-selinux

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
	@cp -f $(WORKSRC)/src/udev/udevd $(DESTDIR)$(libdir)/udev/udevd
	@# eudev install wrongly symlink udevadm from /usr/sbin instead of <rootdir>/usr/sbin
	@rm -rf $(DESTDIR)$(sbindir)/udevadm
	@cd $(DESTDIR)$(sbindir) ; ln -sf ../bin/udevadm ./udevadm
	@$(MAKECOOKIE)
