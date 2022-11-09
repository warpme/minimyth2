
GARNAME      = brcmfmac43455-firmware
# Git master from 23.06.2021
GARVERSION   = 00de3194a96397c913786945ac0af1fd6fbec45b
CATEGORIES   = firmware
MASTER_SITES = https://github.com/RPi-Distro/firmware-nonfree/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
WORKSRC = $(WORKDIR)/firmware-nonfree-$(GARVERSION)

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac43455* $(DESTDIR)$(elibdir)/firmware/brcm/

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.bin $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.bin $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.bin $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-a.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.bin $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.bin $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.radxa,rock3c.bin

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.txt $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.radxa,rock3c.txt

	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-a.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455-sdio.radxa,rock3c.clm_blob

	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455*
