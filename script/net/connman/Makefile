
GARNAME      = connman
GARVERSION   = 1.40
CATEGORIES   = new
MASTER_SITES = https://www.kernel.org/pub/linux/network/connman/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libmnl net/iptables net/wpa_supplicant

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


CONFIGURE_ARGS = $(DIRPATHS) \
	--build=$(GARBUILD) \
	--host=$(GARHOST) \
	--prefix="$(prefix)" \
	--sysconfdir="$(sysconfdir)" \
	--localstatedir="$(localstatedir)" \
	--datarootdir="$(sysconfdir)" \
	--datadir="$(sysconfdir)" \
	--with-runstatedir=/run \
	--libexecdir="$(libexecdir)" \
	--disable-ethernet \
	--disable-gadget \
	--enable-wifi \
	--disable-bluetooth \
	--disable-ofono \
	--disable-dundee \
	--disable-iwd \
	--disable-pacrunner \
	--disable-loopback \
	--disable-wispr \
	--disable-polkit \
	--disable-nmcompat \
	--enable-client \

include ../../gar.mk

post-install:
	cp -rf $(DESTDIR)$(sharedstatedir)/dbus-1/system.d/connman.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	cp -rf $(DESTDIR)$(sharedstatedir)/dbus-1/system.d/connman-vpn-dbus.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	@mkdir -p $(DESTDIR)$(sysconfdir)/connman
	@cp -rf $(WORKSRC)/src/main.conf $(DESTDIR)$(sysconfdir)/connman/
	@$(MAKECOOKIE)
