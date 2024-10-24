
GARNAME      = iwd
GARVERSION   = 3.0
CATEGORIES   = net
MASTER_SITES = https://www.kernel.org/pub/linux/network/wireless/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz
PATCHFILES   = 01-band-correct-oper-class-136-starting-frequency.patch
PATCHFILES  += 02-nl80211util-check-band-when-parsing-supported-frequencies.patch
PATCHFILES  += 03-band-check-the-operating-class-band-before-checking-e4.patch
PATCHFILES  += 04-scan-warn-on-zero-frequency-when-adding-to-request.patch
PATCHFILES  += 05-util-warn-on-invalid-channels-when-iterating-a-frequency-set.patch
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/readline

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) \
	--build=$(GARBUILD) \
	--host=$(GARHOST) \
	--prefix="$(prefix)" \
	--enable-wired \
	--enable-hwsim \
	--enable-tools \
	--disable-ofono \
	--disable-systemd-service \
	--disable-manual-pages \

include ../../gar.mk

post-install:
	cp -rf $(DESTDIR)$(sharedstatedir)/dbus-1/system.d/ead-dbus.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	cp -rf $(DESTDIR)$(sharedstatedir)/dbus-1/system.d/hwsim-dbus.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	cp -rf $(DESTDIR)$(sharedstatedir)/dbus-1/system.d/iwd-dbus.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	@$(MAKECOOKIE)
