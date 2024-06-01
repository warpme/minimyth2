
GARNAME      = linux-firmware-iwlwifi-fw
GARVERSION   = 2023-11-16-fixed
CATEGORIES   = firmware
MASTER_SITES = https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git/snapshot/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      =
DESCRIPTION  =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/iwlwifi* $(DESTDIR)$(elibdir)/firmware/
	@$(MAKECOOKIE)

clean-all: clean
