
GARNAME      = bootfiles-s905w2.tv98
GARVERSION   = 2025-11-22
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
             boot.config \
             minimyth.conf \
             box-s905w2-ap201.config \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = bootloader
INSTALL_SCRIPTS = bootloader
CLEAN_SCRIPTS   = bootloader

include ../../gar.mk

build-bootloader:
	@#$(MAKECOOKIE)

install-bootloader:
	@$(MAKE) clean-all install -C ../aml-bootscipts-vendor-uboot
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/boot.config $(DESTDIR)/boot/boot.config
	@mkdir -p $(DESTDIR)/boot/box-config
	@cp -rf   $(WORKSRC)/box-s905w2-ap201.config $(DESTDIR)/boot/box-config/
	@cp -f $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-bootloader:
	@rm -rf $(DESTDIR)/boot/box-config/box-s905w2-ap201.config
	@rm -f  $(DESTDIR)/boot/boot.config
	@rm -f  $(DESTDIR)/boot/minimyth.conf

clean-all: clean-bootloader cookieclean downloadclean
	@$(MAKE) clean-all -C ../aml-bootscipts-vendor-uboot
