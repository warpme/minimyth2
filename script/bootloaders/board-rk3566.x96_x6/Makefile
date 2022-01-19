
GARNAME      = bootfiles-rk3566.x96_x6
GARVERSION   = 2022-01-03
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               extlinux.conf \
               minimyth.conf   \

export mm_U-BOOT_BOARD_TYPE = rk3566-x96_x6_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean   -C ../u-boot-rk3566
	@$(MAKE) install -C ../u-boot-rk3566
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/rk3566loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/idblock.bin $(DESTDIR)/boot/rk3566loaderfiles/idblock.bin
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/uboot.img   $(DESTDIR)/boot/rk3566loaderfiles/uboot.img
	@cp -f    $(WORKSRC)/minimyth.conf                           $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf                           $(DESTDIR)/boot/extlinux/extlinux.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-all:
	@rm -f  $(DESTDIR)/boot/rk3566_u-boot
	@rm -rf $(DESTDIR)/boot/rk3566loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/extlinux/extlinux.conf
