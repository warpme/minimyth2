
GARNAME      = linux-firmware-meson
GARVERSION   = f23e523ba82e3fd0701f995896c7776b388e4f74
CATEGORIES   = firmware
MASTER_SITES = https://github.com/jefflessard/meson-vdec-extra/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/meson-vdec-extra-$(GARVERSION)/firmware/meson/vdec-new

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/meson/vdec
	@cp -Rdf $(WORKSRC)/*.bin $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/meson/vdec/
