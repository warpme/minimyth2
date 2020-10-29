
GARNAME      = bootfiles-s905
GARVERSION   = 2020-10-29
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = s905_autoscript \
               s905_autoscript.txt \
               uEnv.ini \

export mm_U-BOOT_BOARD_TYPE = p212_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

# Skipping U-Boot build as we are using vendor U-Boot
build-custom:
#	@$(MAKE) clean -C ../u-boot-amlogic
#	@$(MAKE) install -C ../u-boot-amlogic
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/s905_autoscript                       $(DESTDIR)/boot/s905_autoscript
	@cp -f $(WORKSRC)/s905_autoscript.txt                   $(DESTDIR)/boot/s905_autoscript.txt
	@cp -f $(WORKSRC)/uEnv.ini                              $(DESTDIR)/boot/uEnv.ini
	@cp -f $(DESTDIR)/boot/dtbs/amlogic/meson-gxl-s905w-tx3-mini.dtb $(DESTDIR)/boot/s905_dtb

clean-all:
	@rm -f $(DESTDIR)/boot/s905_autoscript
	@rm -f $(DESTDIR)/boot/s905_autoscript.txt
	@rm -f $(DESTDIR)/boot/uEnv.ini
	@rm -f $(DESTDIR)/boot/s905_dtb
	@rm -f $(DESTDIR)/boot/s905_u-boot
