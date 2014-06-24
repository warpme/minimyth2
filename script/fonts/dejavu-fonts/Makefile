GARNAME = dejavu-fonts
GARVERSION = 2.33
CATEGORIES = fonts
MASTER_SITES = http://sourceforge.net/projects/dejavu/files/dejavu/$(GARVERSION)/
# http://sourceforge.net/projects/dejavu/files/dejavu/2.33/dejavu-fonts-ttf-2.33.tar.bz2
DISTFILES = $(GARNAME)-ttf-$(GARVERSION).tar.bz2
LICENSE = $(GARNAME) GPL2
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION =
define BLURB
endef

WORKSRC = $(WORKDIR)/$(GARNAME)-ttf-$(GARVERSION)

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(datadir)/fonts/X11/TTF
	@cp -f $(WORKSRC)/ttf/DejaVuSans.ttf $(DESTDIR)$(datadir)/fonts/X11/TTF
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -f  $(DESTDIR)$(datadir)/fonts/X11/TTF/DejaVuSans.ttf
	@rm -fr $(DESTDIR)$(licensedir)/$(GARNAME)
