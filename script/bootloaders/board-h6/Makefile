# wget http://os.archlinuxarm.org/os/allwinner/boot/pine64/u-boot-sunxi-with-spl.bin
# dd if=u-boot-sunxi-with-spl.bin of=/dev/sdX bs=8k seek=1


GARNAME      = bootfiles-h6
GARVERSION   = 2019-04-29
CATEGORIES   = bootloaders
MASTER_SITES = http://os.archlinuxarm.org/os/allwinner/boot/pine64/
DISTFILES    = u-boot-sunxi-with-spl.bin \
               h6-boot-debug.scr \
               h6-boot-debug.txt \
               h6-boot.scr \
               h6-boot.txt \

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

export mm_U-BOOT_BOARD_TYPE = pine_h64_defconfig

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/h6-boot-debug.txt                 $(DESTDIR)/boot/boot-debug.txt
	@cp -f    $(WORKSRC)/h6-boot-debug.scr                 $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/h6-boot.txt                       $(DESTDIR)/boot/boot.txt
	@cp -f    $(WORKSRC)/h6-boot.scr                       $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/h6loaderfiles
	@cp -f    $(DESTDIR)/boot/dtbs/allwinner/sun50i-h6-pine-h64.dtb $(DESTDIR)/boot/h6_dtb
	@cp -f    $(WORKSRC)/u-boot-sunxi-with-spl.bin         $(DESTDIR)/boot/h6loaderfiles/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/boot-debug.txt
	@rm -f $(DESTDIR)/boot/boot-debug.scr
	@rm -f $(DESTDIR)/boot/boot.txt
	@rm -f $(DESTDIR)/boot/boot.scr
	@rm -f $(DESTDIR)/boot/h6_dtb
	@rm -f $(DESTDIR)/boot/h6loaderfiles/u-boot-sunxi-with-spl.bin
