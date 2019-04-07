#wget http://os.archlinuxarm.org/os/rockchip/boot/rock64/idbloader.img
#wget http://os.archlinuxarm.org/os/rockchip/boot/rock64/uboot.img
#wget http://os.archlinuxarm.org/os/rockchip/boot/rock64/trust.img
#dd if=idbloader.img of=/dev/sdX seek=64 conv=notrunc
#dd if=uboot.img of=/dev/sdX seek=16384 conv=notrunc
#dd if=trust.img of=/dev/sdX seek=24576 conv=notrunc



GARNAME      = bootfiles-rk3328
GARVERSION   = 2019-04-03
CATEGORIES   = bootloaders
MASTER_SITES = http://os.archlinuxarm.org/os/rockchip/boot/rock64/
DISTFILES    = idbloader.img \
               trust.img \
               uboot.img \
               extlinux.conf \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = bootloaders/u-boot

BUILD_SCRIPTS   =
INSTALL_SCRIPTS = custom

include ../../gar.mk

export mm_U-BOOT_BOARD_TYPE = evb-rk3328_defconfig

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/rk3328loaderfiles
	@cp -f    $(WORKSRC)/extlinux.conf                        $(DESTDIR)/boot/extlinux/extlinux.conf
	@cp -f    $(DESTDIR)/boot/dtbs/rockchip/rk3328-rock64.dtb $(DESTDIR)/boot/rk3328_dtb
	@cp -f    $(WORKSRC)/idbloader.img                        $(DESTDIR)/boot/rk3328loaderfiles/idbloader.img
	@cp -f    $(WORKSRC)/trust.img                            $(DESTDIR)/boot/rk3328loaderfiles/trust.img
	@cp -f    $(WORKSRC)/uboot.img                            $(DESTDIR)/boot/rk3328loaderfiles/uboot.img
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/extlinux/extlinux.conf
	@rm -f $(DESTDIR)/boot/rk3328_dtb
	@rm -f $(DESTDIR)/boot/rk3328_u-boot
	@rm -f $(DESTDIR)/boot/rk3328loaderfiles/idbloader.img
	@rm -f $(DESTDIR)/boot/rk3328loaderfiles/trust.img
	@rm -f $(DESTDIR)/boot/rk3328loaderfiles/uboot.img
