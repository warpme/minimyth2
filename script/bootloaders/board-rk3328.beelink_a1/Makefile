
GARNAME      = bootfiles-rk3328.beelink_a1
GARVERSION   = 2020-03-17
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
	@cp -f    $(WORKSRC)/rk3328-boot-debug.txt                $(DESTDIR)/boot/rk3328-boot-debug.txt
	@cp -f    $(WORKSRC)/rk3328-boot-debug.scr                $(DESTDIR)/boot/rk3328-boot-debug.scr
	@cp -f    $(WORKSRC)/rk3328-boot.txt                      $(DESTDIR)/boot/rk3328-boot.txt
	@cp -f    $(WORKSRC)/rk3328-boot.scr                      $(DESTDIR)/boot/rk3328-boot.scr
	@cp -f    $(WORKSRC)/rk3328-boot-debug.txt                $(DESTDIR)/boot/boot-debug.txt
	@cp -f    $(WORKSRC)/rk3328-boot-debug.scr                $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/rk3328-boot.txt                      $(DESTDIR)/boot/boot.txt
	@cp -f    $(WORKSRC)/rk3328-boot.scr                      $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/rk3328loaderfiles
	@cp -f    $(DESTDIR)/boot/dtbs/rockchip/rk3328-a1.dtb     $(DESTDIR)/boot/rk3328_dtb
	@cp -f    $(DESTDIR)/boot/dtbs/rockchip/rk3328-a1.dtb     $(DESTDIR)/boot/rk3328-a1.dtb
	@cp -f    $(WORKSRC)/idbloader.img                        $(DESTDIR)/boot/rk3328loaderfiles/idbloader.img
	@cp -f    $(WORKSRC)/trust.img                            $(DESTDIR)/boot/rk3328loaderfiles/trust.img
	@cp -f    $(WORKSRC)/uboot.img                            $(DESTDIR)/boot/rk3328loaderfiles/uboot.img

clean-all:
	@rm -f  $(DESTDIR)/boot/rk3328-boot-debug.txt
	@rm -f  $(DESTDIR)/boot/rk3328-boot-debug.scr
	@rm -f  $(DESTDIR)/boot/rk3328-boot.txt
	@rm -f  $(DESTDIR)/boot/rk3328-boot.scr
	@rm -f  $(DESTDIR)/boot/boot-debug.txt
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.txt
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -f  $(DESTDIR)/boot/rk3328_dtb
	@rm -f  $(DESTDIR)/boot/rk3328_u-boot
	@rm -rf $(DESTDIR)/boot/rk3328loaderfiles*
	@rm -f  $(DESTDIR)/boot/rk3328-a1.dtb
