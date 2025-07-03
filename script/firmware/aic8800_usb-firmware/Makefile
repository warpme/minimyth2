
GARNAME      = aic8800_usb-firmware
# 3.07.2025 v2024_1119_g06da8476
GARVERSION   = e732e3b8b8ea4e08668290866ba8d06dd145cf03
CATEGORIES   = firmware
MASTER_SITES = https://github.com/radxa-pkg/aic8800/archive/
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
