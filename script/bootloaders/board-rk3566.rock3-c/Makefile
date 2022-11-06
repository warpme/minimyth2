
GARNAME      = bootfiles-rk3566.rock3-c
GARVERSION   = 2022-11-05
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

export mm_U-BOOT_BOARD_TYPE = rock-3c-rk3566_defconfig

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
	@$(MAKE) clean   -C ../u-boot-rk3566-radxa
	@$(MAKE) install -C ../u-boot-rk3566-radxa
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/rk3566loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img $(DESTDIR)/boot/rk3566loaderfiles/idbloader.img
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb    $(DESTDIR)/boot/rk3566loaderfiles/u-boot.itb
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/rk3566loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/extlinux*

clean-all: clean-custom cookieclean
