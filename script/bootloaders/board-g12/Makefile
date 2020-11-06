
GARNAME      = bootfiles-g12
GARVERSION   = 2020-03-17
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

# Skipping U-Boot build as we are using build-in U-Boot
build-custom:
#	@$(MAKE) clean -C ../u-boot-amlogic
#	@$(MAKE) install -C ../u-boot-amlogic
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/s905_autoscript                           $(DESTDIR)/boot/s905_autoscript
	@cp -f $(WORKSRC)/s905_autoscript.txt                       $(DESTDIR)/boot/s905_autoscript.txt
	@cp -f $(WORKSRC)/uEnv.ini                                  $(DESTDIR)/boot/uEnv.ini
	@cp -f $(DESTDIR)/boot/dtbs/amlogic/meson-g12a-x96-max.dtb  $(DESTDIR)/boot/g12a_dtb
	@cp -f $(DESTDIR)/boot/dtbs/amlogic/meson-g12a-x96-max.dtb  $(DESTDIR)/boot/meson-g12a-x96-max.dtb
	@cp -f $(WORKSRC)/boot.ini                                  $(DESTDIR)/boot/boot.ini
	@cp -f $(WORKSRC)/u-boot.ext                                $(DESTDIR)/boot/u-boot.ext

clean-all:
	@rm -f $(DESTDIR)/boot/s905_autoscript
	@rm -f $(DESTDIR)/boot/s905_autoscript.txt
	@rm -f $(DESTDIR)/boot/uEnv.ini
	@rm -f $(DESTDIR)/boot/g12a_dtb
	@rm -f $(DESTDIR)/boot/boot.ini
	@rm -f $(DESTDIR)/boot/u-boot.ext
	@rm -f $(DESTDIR)/boot/meson-g12a-x96-max.dtb
