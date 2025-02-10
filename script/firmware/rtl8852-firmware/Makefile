
GARNAME      = rtl8852-firmware
GARVERSION   = 55c4b69c35fc9c0db5eed259e49ae91e12ead494
CATEGORIES   = firmware
MASTER_SITES = https://github.com/radxa-pkg/radxa-firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/radxa-firmware-$(GARVERSION)/firmware

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/rtl_bt
	@cp -Rdf $(WORKSRC)/rtl8852bu_config $(DESTDIR)$(elibdir)/firmware/rtl_bt/rtl8852bu_config.bin
	@# for fw we are using blobs from linux-firmware
	@# cp -Rdf $(WORKSRC)/rtl8852bu_fw     $(DESTDIR)$(elibdir)/firmware/rtl_bt/rtl8852bu_fw.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/rtl_bt/rtl8852bu_config.bin
	@# rm -rf $(DESTDIR)$(elibdir)/firmware/rtl_bt/rtl8852bu_fw.bin
