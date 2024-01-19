
GARNAME      = bootfiles-rk3568.rock3-b
GARVERSION   = 2022-05-10
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               rk3568-boot.scr \
               rk3568-boot.txt \
               rk3568-boot-debug.scr \
               rk3568-boot-debug.txt \

export mm_U-BOOT_BOARD_TYPE = rock-3b-rk3568_defconfig

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
	@$(MAKE) clean   -C ../u-boot-rk35xx-radxa
	@$(MAKE) install -C ../u-boot-rk35xx-radxa
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/rk3568loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3568/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img $(DESTDIR)/boot/rk3568loaderfiles/idbloader.img
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3568/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb    $(DESTDIR)/boot/rk3568loaderfiles/u-boot.itb
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/rk3568-boot-debug.scr $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/rk3568-boot.scr       $(DESTDIR)/boot/boot.scr
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/rk3568loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/*.scr

clean-all: clean-custom cookieclean
