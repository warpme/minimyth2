
GARNAME      = bootfiles-h618.orangepi_zero2w
GARVERSION   = 2023-10-13
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               h618-boot-debug.scr \
               h618-boot-debug.txt \
               h618-boot.scr       \
               h618-boot.txt       \
               minimyth.conf       \

export mm_U-BOOT_BOARD_TYPE = orangepi_zero3_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

build-custom:
	@# swith to u-boot-h618-orangepi-zero3 as u-boot-h616 not works ok (yet)
	@# $(MAKE) clean-all install -C ../u-boot-h616
	@$(MAKE) clean-all install -C ../u-boot-h618-orangepi-zero3
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/h618-boot-debug.scr                                 $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/h618-boot.scr                                       $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/h616loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin \
		  $(DESTDIR)/boot/h616loaderfiles/u-boot-sunxi-with-spl.bin
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -rf $(DESTDIR)/boot/h616loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
