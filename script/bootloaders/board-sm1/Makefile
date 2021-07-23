
GARNAME      = bootfiles-sm1
GARVERSION   = 2020-11-07
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = s905_autoscript \
               s905_autoscript.txt \
               uEnv.ini \
               boot.ini \
               u-boot.ext \
               minimyth.conf \

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
	@cp -f $(WORKSRC)/s905_autoscript                            $(DESTDIR)/boot/s905_autoscript
	@cp -f $(WORKSRC)/uEnv.ini                                   $(DESTDIR)/boot/uEnv.ini
	@cp -f $(WORKSRC)/boot.ini                                   $(DESTDIR)/boot/boot.ini
	@cp -f $(WORKSRC)/u-boot.ext                                 $(DESTDIR)/boot/u-boot.ext
	@cp -f $(WORKSRC)/minimyth.conf                              $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-all:
	@rm -f $(DESTDIR)/boot/s905_autoscript
	@rm -f $(DESTDIR)/boot/uEnv.ini
	@rm -f $(DESTDIR)/boot/boot.ini
	@rm -f $(DESTDIR)/boot/u-boot.ext
	@rm -f $(DESTDIR)/boot/minimyth.conf
