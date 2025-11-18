
GARNAME      = bootfiles-s905w2.tv98
GARVERSION   = 2025-11-17
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
 aml_autoscript \
 boot.config \
 boot.scr \
 bootscript \
 cfgload \
 emmc_autoscript \
 s905_autoscript \
 box-s805x2-aq222.config \
 box-s905w2-ap201.config \
 minimyth.conf \

export mm_U-BOOT_BOARD_TYPE = p212_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

# Skipping U-Boot build as we are using vendor U-Boot
build-custom:
#	@$(MAKE) clean -C ../u-boot-amlogic
#	@$(MAKE) install -C ../u-boot-amlogic
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/s905_autoscript         $(DESTDIR)/boot/s905_autoscript
	@cp -f $(WORKSRC)/aml_autoscript          $(DESTDIR)/boot/aml_autoscript
	@cp -f $(WORKSRC)/emmc_autoscript         $(DESTDIR)/boot/emmc_autoscript
	@cp -f $(WORKSRC)/boot.config             $(DESTDIR)/boot/boot.config
	@cp -f $(WORKSRC)/boot.scr                $(DESTDIR)/boot/boot.scr
	@cp -f $(WORKSRC)/bootscript              $(DESTDIR)/boot/bootscript
	@cp -f $(WORKSRC)/cfgload                 $(DESTDIR)/boot/cfgload
	@cp -f $(WORKSRC)/minimyth.conf           $(DESTDIR)/boot/minimyth.conf
	@mkdir -p $(DESTDIR)/boot/box-config
	@cp -f $(WORKSRC)/box-s805x2-aq222.config $(DESTDIR)/boot/box-config/box-s805x2-aq222.config
	@cp -f $(WORKSRC)/box-s905w2-ap201.config $(DESTDIR)/boot/box-config/box-s905w2-ap201.config
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f $(DESTDIR)/boot/*_autoscript
	@rm -f $(DESTDIR)/boot/boot.*
	@rm -f $(DESTDIR)/boot/bootscript
	@rm -f $(DESTDIR)/boot/cfgload
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
