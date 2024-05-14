
GARNAME       = brcmfmac4359-firmware
GARVERSION    = db8deb03b8d24e5069ac4581d1c35b767012e926
CATEGORIES    = firmware
MASTER_SITES  = https://github.com/murata-wireless/cyw-fmac-fw/archive/
DISTFILES     = $(GARVERSION).zip brcmfmac4359-sdio.txt
WORKSRC       = $(WORKDIR)/cyw-fmac-fw-$(GARVERSION)
LICENSE       =
DESCRIPTION   =

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -f   $(WORKDIR)/brcmfmac4359-sdio.txt                            $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.txt    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.AP6398S.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.txt    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.rockchip,rk3566-box-demo-v10.txt

	@cp -f   $(WORKSRC)/cyfmac4359-sdio.bin                              $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.bin    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.AP6398S.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.bin    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.rockchip,rk3566-box-demo-v10.bin

	@cp -f   $(WORKSRC)/cyfmac4359-sdio.1WZ.clm_blob                          $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.clm_blob    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.AP6398S.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.clm_blob    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359-sdio.rockchip,rk3566-box-demo-v10.clm_blob

	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac4359*
