
GARNAME      = linux-firmware
GARVERSION   = 5179d3558a336a270b38555579252ec81073ee5c
CATEGORIES   = firmware
MASTER_SITES = https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/
DISTFILES    = linux-firmware-$(GARVERSION).tar.gz
LICENSE      =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

BRCM_SOURCE=$(DESTDIR)$(elibdir)/firmware/cypress
BRCM_DEST=$(DESTDIR)$(elibdir)/firmware/brcm

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/

	@# Broadcom 43430 bin and clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43430-sdio.bin      $(BRCM_DEST)/brcmfmac43430-sdio.AP6212.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43430-sdio.bin      $(BRCM_DEST)/brcmfmac43430-sdio.raspberrypi,3-model-b.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43430-sdio.clm_blob $(BRCM_DEST)/brcmfmac43430-sdio.AP6212.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43430-sdio.clm_blob $(BRCM_DEST)/brcmfmac43430-sdio.raspberrypi,3-model-b.clm_blob

	@# Broadcom 43455 bin and clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.bin      $(BRCM_DEST)/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.bin      $(BRCM_DEST)/brcmfmac43455-sdio.raspberrypi,4-model-b.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.bin      $(BRCM_DEST)/brcmfmac43455-sdio.pine64,quartz64-a.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.bin      $(BRCM_DEST)/brcmfmac43455-sdio.pine64,quartz64-b.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.bin      $(BRCM_DEST)/brcmfmac43455-sdio.radxa,rock3c.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.bin      $(BRCM_DEST)/brcmfmac43455-sdio.eachlink,h6mini.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.bin      $(BRCM_DEST)/brcmfmac43455-sdio.radxa,rockpi4se.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.clm_blob $(BRCM_DEST)/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.clm_blob $(BRCM_DEST)/brcmfmac43455-sdio.raspberrypi,4-model-b.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.clm_blob $(BRCM_DEST)/brcmfmac43455-sdio.pine64,quartz64-a.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.clm_blob $(BRCM_DEST)/brcmfmac43455-sdio.pine64,quartz64-b.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.clm_blob $(BRCM_DEST)/brcmfmac43455-sdio.radxa,rock3c.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.clm_blob $(BRCM_DEST)/brcmfmac43455-sdio.eachlink,h6mini.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43455-sdio.clm_blob $(BRCM_DEST)/brcmfmac43455-sdio.radxa,rockpi4se.clm_blob
ifeq (0,1)
	@# Broadcom 43456 bin and clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.radxa,rockpi4b.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.radxa,rockpi4c.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.radxa,zero.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.radxa,zero2.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.pine64,pinebook-pro.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.pine64,rockpro64-v2.1.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.pine64,quartz64-a.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.pine64,quartz64-b.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.rockchip,rk3399-orangepi.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.xunlong,orangepi-3.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.bin       $(BRCM_DEST)/brcmfmac43456-sdio.xunlong,orangepi-4.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.radxa,rockpi4b.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.radxa,rockpi4c.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.radxa,zero.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.radxa,zero2.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.pine64,pinebook-pro.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.pine64,rockpro64-v2.1.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.pine64,quartz64-a.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.pine64,quartz64-b.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.rockchip,rk3399-orangepi.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.xunlong,orangepi-3.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac43456-sdio.clm_blob  $(BRCM_DEST)/brcmfmac43456-sdio.xunlong,orangepi-4.clm_blob
endif

ifeq (0,1)
	@# Broadcom 4334 bin, clm_blob and txt -> currently installed by brcmfmac6334-firmware
	@ln -srf $(BRCM_DEST)/brcmfmac4334-sdio.bin               $(BRCM_DEST)/brcmfmac4334-sdio.tanix,tx6s.bin
	@# fake clm_blob file as i can't find correct file....
	@touch                                                    $(BRCM_DEST)/brcmfmac4334-sdio.tanix,tx6s.clm_blob
	@ln -srf $(BRCM_DEST)/brcmfmac4330-sdio.Prowise-PT301.txt $(BRCM_DEST)/brcmfmac4334-sdio.tanix,tx6s.txt
endif

	@# Broadcom 4354 bin and clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac4354-sdio.bin      $(BRCM_DEST)/brcmfmac4354-sdio.amediatech,x96-x6.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac4354-sdio.clm_blob $(BRCM_DEST)/brcmfmac4354-sdio.amediatech,x96-x6.clm_blob

ifeq (0,1)
	@# Broadcom 4359 bin and clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac4359-sdio.bin      $(BRCM_DEST)/brcmfmac4359-sdio.AP6398S.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac4359-sdio.bin      $(BRCM_DEST)/brcmfmac4359-sdio.rockchip,rk3566-box-demo-v10.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac4359-sdio.clm_blob $(BRCM_DEST)/brcmfmac4359-sdio.AP6398S.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac4359-sdio.clm_blob $(BRCM_DEST)/brcmfmac4359-sdio.rockchip,rk3566-box-demo-v10.clm_blob
endif
ifeq (0,1)
	@# Broadcom 6330 bin and clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac-ap6330-sdio.bin      $(BRCM_DEST)/brcmfmac-ap6330-sdio.oranth,tanix-tx6-mini.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac-ap6330-sdio.bin      $(BRCM_DEST)/brcmfmac-ap6330-sdio.oranth,tanix-tx6.bin
	@ln -srf $(BRCM_SOURCE)/cyfmac-ap6330-sdio.clm_blob $(BRCM_DEST)/brcmfmac-ap6330-sdio.oranth,tanix-tx6-mini.clm_blob
	@ln -srf $(BRCM_SOURCE)/cyfmac-ap6330-sdio.clm_blob $(BRCM_DEST)/brcmfmac-ap6330-sdio.oranth,tanix-tx6.clm_blob
endif
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware*
