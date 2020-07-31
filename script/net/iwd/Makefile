
GARNAME      = iwd
GARVERSION   = 1.8
CATEGORIES   = new
MASTER_SITES = https://www.kernel.org/pub/linux/network/wireless/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz
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
	--sysconfdir="$(sysconfdir)" \
	--localstatedir="$(localstatedir)" \
	--datarootdir="$(sysconfdir)" \
	--datadir="$(sysconfdir)" \
	--with-runstatedir=/run \
	--libexecdir="$(libexecdir)" \
	--enable-wired \
	--disable-ofono \
	--disable-external-ell \
	--enable-sim-hardcoded \
	--enable-hwsim \
	--disable-systemd-service \
	--disable-manual-pages \

include ../../gar.mk

post-install:
	cp -rf $(DESTDIR)$(sharedstatedir)/dbus-1/system.d/ead-dbus.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	cp -rf $(DESTDIR)$(sharedstatedir)/dbus-1/system.d/hwsim-dbus.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	cp -rf $(DESTDIR)$(sharedstatedir)/dbus-1/system.d/iwd-dbus.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	@$(MAKECOOKIE)
