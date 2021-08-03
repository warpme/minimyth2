
GARNAME      = hwids
GARVERSION   = 20210613
CATEGORIES   = data
MASTER_SITES = https://github.com/gentoo/hwids/archive/
DISTFILES    = $(DISTNAME).tar.gz

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)/$(GARNAME)-$(GARNAME)-$(GARVERSION)

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(datadir)/
	@rm -f $(DESTDIR)$(datadir)/hwdata/usb.ids
	@rm -f $(DESTDIR)$(datadir)/hwdata/pci.ids
	@cp $(WORKSRC)/usb.ids $(DESTDIR)$(datadir)/usb.ids
	@cp $(WORKSRC)/pci.ids $(DESTDIR)$(datadir)/pci.ids
	@$(MAKECOOKIE)
