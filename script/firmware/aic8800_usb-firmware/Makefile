
GARNAME      = aic8800_usb-firmware
# 6.08.2025 v20260123.5f7be68d-8
GARVERSION   = df4c783b663eba1956579c681acd5e45f25c671d
MASTER_SITES = https://github.com/radxa-pkg/aic8800/archive/
CATEGORIES   = firmware
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/aic8800-$(GARVERSION)/src/USB/driver_fw/fw/aic8800D80

DEPENDS = 

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/aic8800_usb
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/aic8800_usb/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/aic8800_usb
