
GARNAME      = bootfiles-rk3399.rockpi4-b
GARVERSION   = 2020-11-07
CATEGORIES   = bootloaders
MASTER_SITES = http://os.archlinuxarm.org/os/rockchip/boot/rock64/
DISTFILES    = rksd_loader.img \
               extlinux.conf \
               rk3399-boot-debug.scr \
               rk3399-boot-debug.txt \
               rk3399-boot.scr \
               rk3399-boot.txt \

export mm_U-BOOT_BOARD_TYPE = rock-pi-4-rk3399_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

# Skipping U-Boot build as we are using u-boot from Armbian (thx guys!)
build-custom:
#	@$(MAKE) clean -C ../u-boot-rk3399
#	@$(MAKE) install -C ../u-boot-rk3399
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/rk3399-boot-debug.scr                   $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/rk3399-boot.scr                         $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/rk3399loaderfiles
	@cp -f    $(WORKSRC)/rksd_loader.img                          $(DESTDIR)/boot/rk3399loaderfiles/rksd_loader.img

clean-all:
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -f  $(DESTDIR)/boot/rk3399_u-boot
	@rm -rf $(DESTDIR)/boot/rk3399loaderfiles*
