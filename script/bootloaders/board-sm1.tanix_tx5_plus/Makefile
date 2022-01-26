
GARNAME      = bootfiles-sm1.tanix_tx5_plus
GARVERSION   = 2021-08-05
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = aml_autoscript \
               aml_autoscript.txt \
               cfgload \
               cfgload.txt \
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
	@cp -f $(WORKSRC)/aml_autoscript                             $(DESTDIR)/boot/aml_autoscript
	@cp -f $(WORKSRC)/cfgload                                    $(DESTDIR)/boot/cfgload
	@cp -f $(WORKSRC)/minimyth.conf                              $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f $(DESTDIR)/boot/aml_autoscript
	@rm -f $(DESTDIR)/boot/cfgload
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
