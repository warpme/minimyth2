GARNAME = mozilla-firefox
GARVERSION = 53.0.2
CATEGORIES = browsers
MASTER_SITES = https://download.mozilla.org/?product=firefox-53.0.2-SSL&os=linux64
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/usr/bin/mozilla-firefox-$(GARVERSION)

	@cp -rf $(WORKSRC)/* $(DESTDIR)$(rootdir)/usr/bin/mozilla-firefox-$(GARVERSION)
	@ln -sf ./mozilla-firefox-$(GARVERSION) $(DESTDIR)$(rootdir)/usr/bin/mozilla-firefox
	@$(MAKECOOKIE)
