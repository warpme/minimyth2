
GARNAME      = bootfiles-s905
GARVERSION   = 2018-12-13
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = aml_autoscript \
               aml_autoscript.txt \
               s905_autoscript \
               s905_autoscript.txt \
               uEnv.ini \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

# Skipping U-Boot build as we are using built-in U-Boot
# DEPENDS   = bootloaders/u-boot

BUILD_SCRIPTS   =
INSTALL_SCRIPTS = custom

include ../../gar.mk

export mm_U-BOOT_BOARD_TYPE = p212_defconfig

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/aml_autoscript                        $(DESTDIR)/boot/aml_autoscript
	@cp -f $(WORKSRC)/aml_autoscript.txt                    $(DESTDIR)/boot/aml_autoscript.txt
	@cp -f $(WORKSRC)/s905_autoscript                       $(DESTDIR)/boot/s905_autoscript
	@cp -f $(WORKSRC)/s905_autoscript.txt                   $(DESTDIR)/boot/s905_autoscript.txt
	@cp -f $(WORKSRC)/uEnv.ini                              $(DESTDIR)/boot/uEnv.ini
	@cp -f $(DESTDIR)/boot/dtbs/amlogic/meson-gxl-s905w-tx3-mini.dtb $(DESTDIR)/boot/s905_dtb
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/aml_autoscript
	@rm -f $(DESTDIR)/boot/aml_autoscript.txt
	@rm -f $(DESTDIR)/boot/s905_autoscript
	@rm -f $(DESTDIR)/boot/s905_autoscript.txt
	@rm -f $(DESTDIR)/boot/uEnv.ini
	@rm -f $(DESTDIR)/boot/s905_dtb
	@rm -f $(DESTDIR)/boot/s905_u-boot
