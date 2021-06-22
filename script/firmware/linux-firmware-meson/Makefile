
# https://github.com/superna9999/aml_ucode_parser/tree/log-fws/firmwares 25.12.2019
# https://github.com/superna9999/aml_ucode_parser/archive/992080f341fe94961c1d406c35ded246fa955214.zip
GARNAME      = linux-firmware-meson
GARVERSION   = 992080f341fe94961c1d406c35ded246fa955214
CATEGORIES   = firmware
MASTER_SITES = https://github.com/superna9999/aml_ucode_parser/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/aml_ucode_parser-992080f341fe94961c1d406c35ded246fa955214/firmwares

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

