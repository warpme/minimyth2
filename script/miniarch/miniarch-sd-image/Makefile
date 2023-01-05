
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

build-custom:
	@sed -e "s|@@HOME@@|$(mm_HOME)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@sed -e "s|@@INSTALL@@|$(mm_SDCARD_FILES)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@sed -e "s|@@BOARDS@@|$(mm_BOARD_TYPE)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@sed -e "s|@@ROOTFS@@|$(MINIARCH_ROOTFS)|g" -i $(WORKDIR)/create-miniarch-image.sh
	@echo " " ; \
	 echo "  Building SD card image requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo \"removing /boot files from rootfs as they are in sperate boot dir ...\" ; \
	   rm -rf $(MINIARCH_ROOTFS)/boot/* ; \
	   echo 'building SD card image ...' ; \
	   $(WORKDIR)/create-miniarch-image.sh ; \
	 "
	@$(MAKECOOKIE)

install-custom:
	@echo " " ; \
	 echo "  Installing image requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'installing MiniArch-*-SD-Image.img.xz in [$(mm_SDCARD_FILES)]' ; \
	   mv -f $(WORKDIR)/MiniArch*SD-Image.img.xz $(mm_SDCARD_FILES)/ ; \
	 "
	@$(MAKECOOKIE)
