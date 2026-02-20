
GARNAME      = khadas-edge2-brcm-firmware
# 28.03.2025
GARVERSION   = 04062024
CATEGORIES   = firmware
MASTER_SITES = https://github.com/khadas/khadas-linux-kernel/releases/download/linux-khadas-edge2-brcm-firmware-v1/
DISTFILES    = linux-khadas-edge2-brcm-firmware-v1.tar.gz
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/linux-khadas-edge2-brcm-firmware-v1/lib/firmware

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -Rdf $(WORKSRC)/brcm/fw_bcm43752a2_pcie_ag.bin   $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.bin
	@cp -Rdf $(WORKSRC)/brcm/clm_bcm43752a2_pcie_ag.blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752.clm_blob
	@cp -Rdf $(WORKSRC)/brcm/nvram_AP6275P.txt           $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275p.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.bin  $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.khadas,edge2.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752.clm_blob  $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.khadas,edge2.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275p.txt       $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752-pcie.khadas,edge2.txt
	@cp -Rdf $(WORKSRC)/brcm/BCM4362A2.hcd                     $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.hcd  $(DESTDIR)$(elibdir)/firmware/brcm/BCM4362A2.khadas,edge2.hcd
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43752*
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/nvram_ap6275s*
