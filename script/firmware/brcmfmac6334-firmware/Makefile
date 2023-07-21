GARNAME      = brcmfmac6334-firmware
GARVERSION   = 3a9902186c3d4e81747ca69528af150dcf82fe3c
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
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac4334-sdio.bin                      $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.bin
	@#cp -Rdf $(WORKSRC)/brcm/brcmfmac4334-sdio.txt                     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.txt
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac4334-sdio.rockchip,rk3318-box.txt  $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.txt
	@# there is no brcmfmac4334-sdio.clm_blob so create fake 0 bytes clm_blob file. this seems to allow to boot ok ap6334 wifi....
	@touch $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.clm_blob

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.bin      $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.tanix,tx6s.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.tanix,tx6s.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.txt      $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.tanix,tx6s.txt

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.bin      $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.vontar,h618.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.vontar,h618.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.txt      $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334-sdio.vontar,h618.txt

	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4334*
