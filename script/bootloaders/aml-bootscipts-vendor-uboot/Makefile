
GARNAME      = aml-bootscipts-vendor-uboot
GARVERSION   = 2025-11-22
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

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/s905_autoscript         $(DESTDIR)/boot/s905_autoscript
	@cp -f $(WORKSRC)/aml_autoscript          $(DESTDIR)/boot/aml_autoscript
	@cp -f $(WORKSRC)/emmc_autoscript         $(DESTDIR)/boot/emmc_autoscript
	@cp -f $(WORKSRC)/boot.config             $(DESTDIR)/boot/boot.config
	@cp -f $(WORKSRC)/boot.scr                $(DESTDIR)/boot/boot.scr
	@cp -f $(WORKSRC)/bootscript              $(DESTDIR)/boot/bootscript
	@cp -f $(WORKSRC)/cfgload                 $(DESTDIR)/boot/cfgload
	@mkdir -p $(DESTDIR)/boot/box-config
	@cp -rf   $(WORKSRC)/../../files/box*.config $(DESTDIR)/boot/box-config/
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f  $(DESTDIR)/boot/*_autoscript
	@rm -f  $(DESTDIR)/boot/boot.*
	@rm -f  $(DESTDIR)/boot/bootscript
	@rm -rf $(DESTDIR)/boot/box-config*
	@rm -f  $(DESTDIR)/boot/cfgload

clean-all: clean-custom cookieclean
