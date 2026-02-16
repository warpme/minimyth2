
GARNAME      = ap6275p-firmware
# 7.02.2026
GARVERSION   = f065f271d492193a472a12103a0604ef4178a5c7
CATEGORIES   = firmware
MASTER_SITES = https://github.com/armbian/firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -Rdf $(WORKSRC)/ap6275p/fw_bcm43752a2_pcie_ag.bin   $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.bin
	@cp -Rdf $(WORKSRC)/ap6275p/clm_bcm43752a2_pcie_ag.blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752.clm_blob
	@cp -Rdf $(WORKSRC)/ap6275p/nvram_AP6275P.txt           $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275p.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.bin  $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.khadas,edge2.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752.clm_blob  $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.khadas,edge2.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275p.txt       $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.khadas,edge2.txt
	@cp -Rdf $(WORKSRC)/ap6275p/BCM4362A2.hcd                       $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.hcd       $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.khadas,edge2.hcd
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752*
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275p*
