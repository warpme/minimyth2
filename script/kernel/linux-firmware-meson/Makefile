GARNAME = linux-firmware-meson
GARVERSION = fb505a691b2a37b9d1fc20617433dfd52fb6e27e
CATEGORIES = kernel-amlogic-5.5
MASTER_SITES = https://github.com/Elyotna/linux-firmware/archive/
DISTFILES = $(GARVERSION).zip
LICENSE =
DESCRIPTION =
define BLURB
endef

WORKSRC = $(WORKDIR)/linux-firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/meson* $(DESTDIR)$(elibdir)/firmware/
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(elibdir)/firmware*
