
GARNAME       = brcmfmac4359-firmware
GARVERSION    = 5.4.18-2020_0402
CATEGORIES    = firmware
MASTER_SITES  = https://community.cypress.com/gfawx74859/attachments/gfawx74859/resourcelibrary/1016/1/
DISTFILES     = cypress-fmac-v$(GARVERSION).zip brcmfmac4359-sdio.txt
LICENSE       =
DESCRIPTION   =

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -f   $(WORKDIR)/brcmfmac4359-sdio.txt                            $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.txt    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.rockchip,rk3566-box-demo-v10.txt
	@tar -xf $(WORKDIR)/cypress-firmware-v$(GARVERSION).tar.gz -C $(WORKSRC)
	@cp -Rdf $(WORKSRC)/firmware/brcmfmac4359* $(DESTDIR)$(elibdir)/firmware/brcm/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.bin    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.AP6398S.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.bin    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.rockchip,rk3566-box-demo-v10.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359*
