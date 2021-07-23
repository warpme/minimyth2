
GARNAME      = bootfiles-rk3328.beelink_a1
GARVERSION   = 2020-11-07
CATEGORIES   = bootloaders
MASTER_SITES = http://os.archlinuxarm.org/os/rockchip/boot/rock64/
DISTFILES    = idbloader.img \
               trust.img \
               uboot.img \
               extlinux.conf \
               rk3328-boot-debug.scr \
               rk3328-boot-debug.txt \
               rk3328-boot.scr \
               rk3328-boot.txt \
               minimyth.conf   \

export mm_U-BOOT_BOARD_TYPE = evb-rk3328_defconfig

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
#	@$(MAKE) clean -C ../u-boot-rk3328
#	@$(MAKE) install -C ../u-boot-rk3328
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/rk3328-boot-debug.scr                $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/rk3328-boot.scr                      $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/rk3328loaderfiles
	@cp -f    $(WORKSRC)/idbloader.img                        $(DESTDIR)/boot/rk3328loaderfiles/idbloader.img
	@cp -f    $(WORKSRC)/trust.img                            $(DESTDIR)/boot/rk3328loaderfiles/trust.img
	@cp -f    $(WORKSRC)/uboot.img                            $(DESTDIR)/boot/rk3328loaderfiles/uboot.img
	@cp -f    $(WORKSRC)/minimyth.conf                        $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-all:
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -rf $(DESTDIR)/boot/rk3328loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
