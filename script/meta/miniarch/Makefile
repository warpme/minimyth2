
GARNAME    = miniarch
GARVERSION = $(mm_VERSION)
CATEGORIES = meta
LICENSE    = minimyth
DISTFILES  = 
minimyth_LICENSE_TEXT = $(mm_HOME)/html/minimyth/license.txt

DESCRIPTION =
define BLURB
endef

MINIMYTHIMG = main

DESTIMG = $(MINIMYTHIMG)

DEPENDS = \
	kernel/kernel \
	miniarch/miniarch-rootfs

BUILDDEPS = \
	utils/coreutils \
	devel/fakeroot \
	utils/file \
	utils/findutils \
	utils/module-init-tools \
	utils/tar \
	utils/util-linux \
	lib/libarchive \

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = 
CLEAN_SCRIPTS     = custom

include ../../gar.mk

reinstall-new-board: build

build-custom:
	@echo " ==> Cleaning MiniArch SD card image ..."
	@$(MAKE) -C ../../miniarch/miniarch-sd-image clean
	@echo " ==> Cleaning bootloaders ..."
	@$(MAKE) -C ../../bootloaders/bootloader clean-bootloader
	@echo " ==> Rebuilding and Reinstalling MiniArch SD card image ..."
	@$(MAKE) -C ../../miniarch/miniarch-sd-image install

update-kernel:
	@echo " ==> Cleaning kernel ..."
	@$(MAKE) -C ../../miniarch/linux-pkg clean
	@echo " ==> Cleaning MiniArch rootfs ..."
	@$(MAKE) -C ../../miniarch/miniarch-rootfs clean
	@$(MAKE) reinstall-new-board

clean-custom: cookieclean
	@echo " ==> Cleaning MiniArch rootfs ..."
	@$(MAKE) -C ../../miniarch/miniarch-rootfs clean
	@echo " ==> Cleaning MiniArch SD card image ..."
	@$(MAKE) -C ../../miniarch/miniarch-sd-image clean
	@echo " ==> Cleaning bootloaders ..."
	@$(MAKE) -C ../../bootloaders/bootloader clean-bootloader