GARNAME = mozilla-firefox
GARVERSION = 95.0.2
CATEGORIES = browsers
MASTER_SITES = https://sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/
DISTFILES = firefox-mozilla-build_$(GARVERSION)-0ubuntu1_amd64.deb
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

	@cp -rf $(WORKSRC)/opt/firefox/* $(DESTDIR)$(rootdir)/usr/bin/mozilla-firefox-$(GARVERSION)
	@rm -rf $(DESTDIR)$(rootdir)/usr/bin/mozilla-firefox
	@ln -sf ./mozilla-firefox-$(GARVERSION) $(DESTDIR)$(rootdir)/usr/bin/mozilla-firefox
	@$(MAKECOOKIE)
