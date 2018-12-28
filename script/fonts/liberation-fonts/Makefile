GARNAME = liberation-fonts
GARVERSION = 2.00.1
CATEGORIES = fonts
MASTER_SITES = https://releases.pagure.org/liberation-fonts/
DISTFILES = $(GARNAME)-ttf-$(GARVERSION).tar.gz
LICENSE = OFL1_1

DESCRIPTION =
define BLURB
endef

WORKSRC = $(WORKDIR)/$(GARNAME)-ttf-$(GARVERSION)

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationMono-Bold.ttf        $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationMono-BoldItalic.ttf  $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationMono-Italic.ttf      $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationMono-Regular.ttf     $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationSans-Bold.ttf        $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationSans-BoldItalic.ttf  $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationSans-Italic.ttf      $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationSans-Regular.ttf     $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationSerif-Bold.ttf       $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationSerif-BoldItalic.ttf $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationSerif-Italic.ttf     $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/LiberationSerif-Regular.ttf    $(DESTDIR)$(datadir)/fonts/X11/TTF
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationMono-Bold.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationMono-BoldItalic.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationMono-Italic.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationMono-Regular.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationSans-Bold.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationSans-BoldItalic.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationSans-Italic.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationSans-Regular.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationSerif-Bold.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationSerif-BoldItalic.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationSerif-Italic.ttf
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/LiberationSerif-Regular.ttf
	@rm -fr $(DESTDIR)$(licensedir)/$(GARNAME)
