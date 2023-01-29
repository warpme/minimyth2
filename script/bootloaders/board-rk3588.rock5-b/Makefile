
GARNAME      = bootfiles-rk3588.rock5-b
GARVERSION   = 2023-01-23
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               rk3588-boot.scr \
               rk3588-boot.txt \
               rk3588-boot-debug.scr \
               rk3588-boot-debug.txt \

export mm_U-BOOT_BOARD_TYPE = rock-5b-rk3588_defconfig

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
	@$(MAKE) clean   -C ../u-boot-rk3588-radxa
	@$(MAKE) install -C ../u-boot-rk3588-radxa
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/rk3588loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3588/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img $(DESTDIR)/boot/rk3588loaderfiles/idbloader.img
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3588/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb    $(DESTDIR)/boot/rk3588loaderfiles/u-boot.itb
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/rk3588-boot-debug.scr $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/rk3588-boot.scr       $(DESTDIR)/boot/boot.scr
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/rk3588loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/*.scr

clean-all: clean-custom cookieclean
