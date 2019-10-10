
GARNAME      = bootfiles-rk3399
GARVERSION   = 2019-04-30
CATEGORIES   = bootloaders
MASTER_SITES = http://os.archlinuxarm.org/os/rockchip/boot/rock64/
DISTFILES    = idbloader.img \
               trust.img \
               uboot.img \
               extlinux.conf \
               rk3399-boot-debug.scr \
               rk3399-boot-debug.txt \
               rk3399-boot.scr \
               rk3399-boot.txt \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

# Skipping U-Boot build as we are using pre-built U-Boot from Archlinux ARM (thx guys!)
# DEPENDS   = bootloaders/u-boot

BUILD_SCRIPTS   =
INSTALL_SCRIPTS = custom

include ../../gar.mk

export mm_U-BOOT_BOARD_TYPE = evb-rk3399_defconfig

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/rk3399-boot-debug.txt                   $(DESTDIR)/boot/rk3399-boot-debug.txt
	@cp -f    $(WORKSRC)/rk3399-boot-debug.scr                   $(DESTDIR)/boot/rk3399-boot-debug.scr
	@cp -f    $(WORKSRC)/rk3399-boot.txt                         $(DESTDIR)/boot/rk3399-boot.txt
	@cp -f    $(WORKSRC)/rk3399-boot.scr                         $(DESTDIR)/boot/rk3399-boot.scr
	@cp -f    $(WORKSRC)/rk3399-boot-debug.txt                   $(DESTDIR)/boot/boot-debug.txt
	@cp -f    $(WORKSRC)/rk3399-boot-debug.scr                   $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/rk3399-boot.txt                         $(DESTDIR)/boot/boot.txt
	@cp -f    $(WORKSRC)/rk3399-boot.scr                         $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/rk3399loaderfiles
	@cp -f    $(DESTDIR)/boot/dtbs/rockchip/rk3399-rockpro64.dtb $(DESTDIR)/boot/rk3399_dtb
	@cp -f    $(WORKSRC)/idbloader.img                           $(DESTDIR)/boot/rk3399loaderfiles/idbloader.img
	@cp -f    $(WORKSRC)/trust.img                               $(DESTDIR)/boot/rk3399loaderfiles/trust.img
	@cp -f    $(WORKSRC)/uboot.img                               $(DESTDIR)/boot/rk3399loaderfiles/uboot.img
	@$(MAKECOOKIE)

clean-all:
	@rm -f  $(DESTDIR)/boot/rk3399-boot-debug.txt
	@rm -f  $(DESTDIR)/boot/rk3399-boot-debug.scr
	@rm -f  $(DESTDIR)/boot/rk3399-boot.txt
	@rm -f  $(DESTDIR)/boot/rk3399-boot.scr
	@rm -f  $(DESTDIR)/boot/boot-debug.txt
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.txt
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -f  $(DESTDIR)/boot/rk3399_dtb
	@rm -f  $(DESTDIR)/boot/rk3399_u-boot
	@rm -rf $(DESTDIR)/boot/rk3399loaderfiles*
