
GARNAME      = bootfiles-rk3588s.orangepi_5_pro
GARVERSION   = 2025-06-06
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf

export mm_U-BOOT_BOARD_TYPE      = board-rk3588s.orangepi_5_pro
# uncomment this for dedicated defconfig.
# if commented out, generic defconfig will be used...
# export mm_U-BOOT_BOARD_DEFCONFIG =

WORKSRC      = $(WORKDIR)
LICENSE      = GPL2
DESCRIPTION  =
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
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/rk3588sloaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3588s/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img $(DESTDIR)/boot/rk3588sloaderfiles/idbloader.img
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3588s/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb    $(DESTDIR)/boot/rk3588sloaderfiles/u-boot.itb
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/rk3588sloaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/extlinux*

clean-all: clean-custom cookieclean
