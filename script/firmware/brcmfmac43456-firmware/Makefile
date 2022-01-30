
GARNAME       = brcmfmac43456-firmware
GARVERSION    = master
CATEGORIES    = firmware
MASTER_SITES  = https://github.com/RPi-Distro/firmware-nonfree/archive/refs/heads/
MASTER_SITES += https://gitlab.manjaro.org/manjaro-arm/packages/community/ap6256-firmware/-/archive/master/
DISTFILES     = $(GARVERSION).zip \
		ap6256-firmware-master.tar.bz2 \

LICENSE      =
DESCRIPTION  =
WORKSRC = $(WORKDIR)/ap6256-firmware-$(GARVERSION)

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -Rdf $(WORKSRC)/brcmfmac43456*  $(DESTDIR)$(elibdir)/firmware/brcm/
	@cp -f   $(WORKDIR)/ap6256-firmware-master/nvram_ap6256.txt            $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt
	@cp -f   $(WORKDIR)/ap6256-firmware-master/fw_bcm43456c5_ag.bin        $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin
	@cp -f   $(WORKDIR)/ap6256-firmware-master/brcmfmac43456-sdio.clm_blob $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.clm_blob
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,rockpi4b.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,zero.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,rockpi4c.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.pine64,pinebook-pro.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.pine64,rockpro64-v2.1.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.rockchip,rk3399-orangepi.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.xunlong,orangepi-3.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.txt     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.xunlong,orangepi-4.txt
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,rockpi4b.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,zero.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.radxa,rockpi4c.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.pine64,pinebook-pro.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.pine64,rockpro64-v2.1.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.rockchip,rk3399-orangepi.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.xunlong,orangepi-3.bin
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.bin     $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456-sdio.xunlong,orangepi-4.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43456*
