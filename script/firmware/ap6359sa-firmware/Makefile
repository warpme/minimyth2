
GARNAME      = ap6359sa-firmware
GARVERSION   = 50c463b5e6bab08a4335b12b3462defcdd32805c
CATEGORIES   = firmware
MASTER_SITES = https://github.com/khadas/buildroot_hardware_aml-3.14_amlogic_wifi/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/buildroot_hardware_aml-3.14_amlogic_wifi-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -Rdf $(WORKSRC)/bcm_ampak/config/6359sa/fw_bcm4359c0_ag.bin $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.bin
	@cp -Rdf $(WORKSRC)/bcm_ampak/config/6359sa/nvram.txt           $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.txt

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.bin $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.khadas,vim3.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.bin $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.khadas,vim3l.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.khadas,vim3.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.khadas,vim3l.txt

	@cp -Rdf $(WORKSRC)//bcm_ampak/config/6359sa/BT/BCM4359C0.hcd $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.hcd

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.hcd      $(DESTDIR)$(elibdir)/firmware/brcm/BCM4359C0.khadas,vim3.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa.hcd      $(DESTDIR)$(elibdir)/firmware/brcm/BCM4359C0.khadas,vim3l.hcd
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/ap6359sa*
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/*khadas,vim3*
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/*khadas,vim3l*
