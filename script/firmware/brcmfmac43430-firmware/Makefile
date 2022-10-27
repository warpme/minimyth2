
GARNAME      = brcmfmac43430-firmware
GARVERSION   = 3b108c864428dda9f9833cf3346f438552d08cea
CATEGORIES   = firmware
MASTER_SITES = https://github.com/RPi-Distro/firmware-nonfree/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/firmware-nonfree-$(GARVERSION)/debian/config/brcm80211/brcm
LICENSE      =
DESCRIPTION  =

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -f $(WORKSRC)/brcmfmac43430-sdio.bin      $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -f $(WORKSRC)/brcmfmac43430-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -f $(WORKSRC)/brcmfmac43430-sdio.txt      $(DESTDIR)$(elibdir)/firmware/brcm/

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.bin    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.AP6212.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.bin    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.bin

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.txt    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.AP6212.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.txt    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.clm_blob    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.AP6212.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.clm_blob    $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.clm_blob

	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430*
