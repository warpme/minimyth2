GARNAME = google-chrome
GARVERSION = 65.0.3325.181
CATEGORIES = browsers
MASTER_SITES = https://dl.google.com/linux/direct/
DISTFILES = google-chrome-stable_current_amd64.deb
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)

	@cp -rf $(WORKSRC)/opt/google/chrome/default_apps*           $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -rf $(WORKSRC)/opt/google/chrome/locales*                $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/

	@cp -f $(WORKSRC)/opt/google/chrome/chrome                   $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/chrome_100_percent.pak   $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/chrome_200_percent.pak   $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/chrome-sandbox           $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/icudtl.dat               $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/libwidevinecdm.so        $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/nacl_helper              $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/nacl_helper_bootstrap    $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/nacl_irt_x86_64.nexe     $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/natives_blob.bin         $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@cp -f $(WORKSRC)/opt/google/chrome/resources.pak            $(DESTDIR)$(rootdir)/usr/bin/google-chrome-$(GARVERSION)/
	@rm -f $(DESTDIR)$(rootdir)/usr/bin/google-chrome
	@ln -sf ./google-chrome-$(GARVERSION) $(DESTDIR)$(rootdir)/usr/bin/google-chrome
	@$(MAKECOOKIE)
