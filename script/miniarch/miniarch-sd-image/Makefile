
GARNAME       = miniarch-sd-image
GARVERSION    = 1.0
CATEGORIES    = miniarch
MASTER_SITES  = 
DISTFILES     = create-miniarch-image.sh

LICENSE = GPL2

DEPENDS = \
	miniarch/miniarch-rootfs \
	bootloaders/bootloader \

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = 

include ../../gar.mk
include ../../kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk

MINIARCH_VERSION = $(shell cat $(MINIARCH_ROOTFS)/version)

build-custom:
	@sed -e "s|@@HOME@@|$(mm_HOME)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@sed -e "s|@@INSTALL@@|$(mm_SDCARD_FILES)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@sed -e "s|@@BOARDS@@|$(mm_BOARD_TYPE)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@sed -e "s|@@ROOTFS@@|$(MINIARCH_ROOTFS)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@sed -e "s|@@VERSION@@|$(MINIARCH_VERSION)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@echo " " ; \
	   echo \"removing /boot files from rootfs as they are in sperate boot dir ...\" ; \
	   rm -rf $(MINIARCH_ROOTFS)/boot/* ; \
	   echo 'building SD card image ...' ; \
	   $(WORKDIR)/create-miniarch-image.sh
	@$(MAKECOOKIE)

# not used at install is done by create-miniarch-image.sh script...
install-custom:
	@echo " " ; \
	   echo 'installing MiniArch $(MINIARCH_VERSION) SD Image.img.xz in [$(mm_SDCARD_FILES)]' ; \
	   mv -f $(WORKDIR)/MiniArch*SD-Image.img.xz $(mm_SDCARD_FILES)/
	@$(MAKECOOKIE)
