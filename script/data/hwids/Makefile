
GARNAME      = hwids
GARVERSION   = 20250416
CATEGORIES   = data
MASTER_SITES = http://www.linux-usb.org/ https://pci-ids.ucw.cz/v2.2/
DISTFILES    = usb.ids pci.ids

DESCRIPTION = 
define BLURB
endef

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(datadir)/
	@rm -f $(DESTDIR)$(datadir)/hwdata/usb.ids
	@rm -f $(DESTDIR)$(datadir)/hwdata/pci.ids
	@cp $(WORKDIR)/usb.ids $(DESTDIR)$(datadir)/usb.ids
	@cp $(WORKDIR)/pci.ids $(DESTDIR)$(datadir)/pci.ids
	@$(MAKECOOKIE)
