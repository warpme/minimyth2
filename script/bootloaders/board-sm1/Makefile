
GARNAME      = bootfiles-sm1
GARVERSION   = 2020-01-15
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = s905_autoscript \
               s905_autoscript.txt \
               uEnv.ini \
               boot.ini \
               u-boot.ext \

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
	@cp -f $(WORKSRC)/s905_autoscript                         $(DESTDIR)/boot/s905_autoscript
	@cp -f $(WORKSRC)/s905_autoscript.txt                     $(DESTDIR)/boot/s905_autoscript.txt
	@cp -f $(WORKSRC)/uEnv.ini                                $(DESTDIR)/boot/uEnv.ini
	@cp -f $(DESTDIR)/boot/dtbs/amlogic/meson-sm1-x96-air-2G.dtb $(DESTDIR)/boot/sm1_dtb
	@cp -f $(WORKSRC)/boot.ini                                $(DESTDIR)/boot/boot.ini
	@cp -f $(WORKSRC)/u-boot.ext                              $(DESTDIR)/boot/u-boot.ext

clean-all:
	@rm -f $(DESTDIR)/boot/s905_autoscript
	@rm -f $(DESTDIR)/boot/s905_autoscript.txt
	@rm -f $(DESTDIR)/boot/uEnv.ini
	@rm -f $(DESTDIR)/boot/sm1_dtb
	@rm -f $(DESTDIR)/boot/sm1_u-boot
	@rm -f $(DESTDIR)/boot/boot.ini
	@rm -f $(DESTDIR)/boot/u-boot.ext
