
GARNAME      = wpa_supplicant
GARVERSION   = 2.11
CATEGORIES   = net
MASTER_SITES = https://w1.fi/releases/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz config
WORKSRC      = $(WORKDIR)/$(GARNAME)-$(GARVERSION)/$(GARNAME)
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/readline lib/libnl


CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

BUILD_ARGS   = \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	LIBDIR="$(libdir)" \
	CC="$(CC)" \

INSTALL_ARGS = \
	DESTDIR="$(DESTDIR)" \
	LIBDIR="$(libdir)" \
	BINDIR="$(bindir)" \

include ../../gar.mk

configure-custom:
	@echo "Configuring..."
	@cp $(WORKDIR)/config $(WORKSRC)/.config
	@$(MAKECOOKIE)

build-custom:
	@echo "Building..."
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@echo "Installing..."
	@$(MAKE) -C $(WORKSRC) $(INSTALL_ARGS) install
	@mkdir -p $(DESTDIR)$(sysconfdir)/dbus-1/system.d
	@cp -rf $(WORKSRC)/dbus/dbus-wpa_supplicant.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/wpa_supplicant.conf
	@mkdir -p $(DESTDIR)$(sysconfdir)/wpa_supplicant
	@cp -rf $(WORKSRC)/wpa_supplicant.conf $(DESTDIR)$(sysconfdir)/wpa_supplicant/
	@$(MAKECOOKIE)
