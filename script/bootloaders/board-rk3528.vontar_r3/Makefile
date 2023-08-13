
GARNAME      = bootfiles-rk3528.vontar_r3
GARVERSION   = 2023-07-29
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \
               rk3528-boot.scr \
               rk3528-boot.txt \
               rk3528-boot-debug.scr \
               rk3528-boot-debug.txt \

export mm_U-BOOT_BOARD_TYPE = rk3528_defconfig

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
	@$(MAKE) clean   -C ../u-boot-rk3528
	@$(MAKE) install -C ../u-boot-rk3528
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/rk3528loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3528/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img $(DESTDIR)/boot/rk3528loaderfiles/idbloader.img
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3528/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb    $(DESTDIR)/boot/rk3528loaderfiles/u-boot.itb
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@cp -f    $(WORKSRC)/rk3528-boot-debug.scr $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/rk3528-boot-debug.scr $(DESTDIR)/boot/boot.scr
	@#cp -f    $(WORKSRC)/rk3528-boot.scr       $(DESTDIR)/boot/boot.scr
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/rk3528loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/*.scr

clean-all: clean-custom cookieclean
