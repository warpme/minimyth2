
GARNAME      = linux-firmware
GARVERSION   = 8bb75626e9dd831d323c4e460414b56260f0b700
CATEGORIES   = firmware
MASTER_SITES = https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/
DISTFILES    = linux-firmware-$(GARVERSION).tar.gz
LICENSE      =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware*
