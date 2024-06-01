
GARNAME          = brcmfmac43430-firmware-txt
GARVERSION_RPI   = 3b108c864428dda9f9833cf3346f438552d08cea
GARVERSION_RADXA = e56e16995ac2e4c973aa2898d42357811b2f428d
CATEGORIES       = firmware
MASTER_SITES     = https://github.com/RPi-Distro/firmware-nonfree/archive/ \
                   https://github.com/radxa-pkg/radxa-firmware/archive/

DISTFILES        = $(GARVERSION_RPI).zip $(GARVERSION_RADXA).zip
WORKSRC          = $(WORKDIR)/firmware-nonfree-$(GARVERSION_RPI)/debian/config/brcm80211/brcm
WORKSRC_RADXA    = $(WORKDIR)/radxa-firmware-$(GARVERSION_RADXA)/firmware/brcm
LICENSE          =
DESCRIPTION      =

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -f $(WORKSRC)/brcmfmac43430-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.AP6212.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
	@cp -f $(WORKSRC_RADXA)/brcmfmac43430-sdio.txt  $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430-sdio.radxa,zero3w.txt
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43430*.txt
