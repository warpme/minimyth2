
GARNAME      = bootfiles-rk3399
GARVERSION   = 6437aab36283eb2a4536d9a982fb0655fb558e8a
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/rockchip-linux/rkbin/archive/
DISTFILES    = extlinux.conf \
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

build-custom:
	@$(MAKE) clean -C ../u-boot-rk3399
	@$(MAKE) install -C ../u-boot-rk3399
	@$(MAKECOOKIE)

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
	@cp -f    $(DESTDIR)/boot/dtbs/rockchip/rk3399-rock-pi-4.dtb $(DESTDIR)/boot/rk3399_dtb
	@mkdir -p $(DESTDIR)/boot/rk3399loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/u-boot-rk3399-with-spl.bin \
		  $(DESTDIR)/boot/rk3399loaderfiles/u-boot-rk3399-with-spl.bin

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
	@rm -rf $(DESTDIR)/boot/rk3399loaderfiles*
