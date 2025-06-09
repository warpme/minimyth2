
GARNAME      = bootfiles-rk3328.beelink_a1
GARVERSION   = 2025-06-06
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               extlinux.conf \
               minimyth.conf   \

export mm_U-BOOT_BOARD_TYPE      = board-rk3328.beelink_a1
export mm_U-BOOT_BOARD_DEFCONFIG = beelink-a1-rk3328_defconfig

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
	@$(MAKE) clean   -C ../u-boot-rk
	@$(MAKE) install -C ../u-boot-rk
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/rk3328loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3328/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img $(DESTDIR)/boot/rk3328loaderfiles/idbloader.img
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3328/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb    $(DESTDIR)/boot/rk3328loaderfiles/u-boot.itb
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/rk3328loaderfiles*
	@rm -rf $(DESTDIR)/boot/extlinux*
	@rm -f  $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
