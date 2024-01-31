
GARNAME      = bootfiles-rk3399.rockpi4-se
GARVERSION   = 2023-01-24
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               extlinux.conf \
               rk3399-boot-debug.scr \
               rk3399-boot-debug.txt \
               rk3399-boot.scr \
               rk3399-boot.txt \
               minimyth.conf   \

export mm_U-BOOT_BOARD_TYPE = rk3399-rock-pi-4b

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
	@$(MAKE) clean   -C ../u-boot-rk3399-radxa
	@$(MAKE) install -C ../u-boot-rk3399-radxa
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/rk3399-boot-debug.scr                   $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/rk3399-boot.scr                         $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/rk3399loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img $(DESTDIR)/boot/rk3399loaderfiles/idbloader.img
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/uboot.img     $(DESTDIR)/boot/rk3399loaderfiles/uboot.img
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/trust.img     $(DESTDIR)/boot/rk3399loaderfiles/trust.img
	@cp -f    $(WORKSRC)/minimyth.conf                           $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -f  $(DESTDIR)/boot/rk3399_u-boot
	@rm -rf $(DESTDIR)/boot/rk3399loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
