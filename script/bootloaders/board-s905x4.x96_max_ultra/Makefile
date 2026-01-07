
GARNAME      = bootfiles-s905x4.x96_max_ultra
GARVERSION   = 2026-01-06
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
             boot.config \
             minimyth.conf \
             box-s905x4-ah212.config \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean-all install -C ../aml-bootscipts-vendor-uboot
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/boot.config $(DESTDIR)/boot/boot.config
	@mkdir -p $(DESTDIR)/boot/box-config
	@cp -rf   $(WORKSRC)/box-s905x4-ah212.config $(DESTDIR)/boot/box-config/
	@cp -f $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/box-config/box-s905x4-ah212.config
	@rm -f  $(DESTDIR)/boot/boot.config
	@rm -f  $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean 
	@$(MAKE) clean-all -C ../aml-bootscipts-vendor-uboot
