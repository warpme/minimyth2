
GARNAME      = bootfiles-h616.tanix_tx6s
GARVERSION   = 2020-12-08
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               h616-boot-debug.scr \
               h616-boot-debug.txt \
               h616-boot.scr       \
               h616-boot.txt       \

# using orangepi_zero2_defconfig as uboot-h616 don't have yet dedicated defconfig for tx6s
export mm_U-BOOT_BOARD_TYPE = orangepi_zero2_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean -C ../u-boot-h616
	@$(MAKE) install -C ../u-boot-h616
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/h616-boot-debug.scr                                 $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/h616-boot.scr                                       $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/h616loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin \
		  $(DESTDIR)/boot/h616loaderfiles/u-boot-sunxi-with-spl.bin

clean-all:
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -rf $(DESTDIR)/boot/h616loaderfiles*
