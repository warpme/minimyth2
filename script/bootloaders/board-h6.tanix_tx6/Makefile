
GARNAME      = bootfiles-h6.tanix_tx6
GARVERSION   = 2019-09-05
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               h6-boot-debug.scr \
               h6-boot-debug.txt \
               h6-boot.scr       \
               h6-boot.txt       \

export mm_U-BOOT_BOARD_TYPE = tanix_tx6_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean -C ../u-boot-sunxi
	@$(MAKE) install -C ../u-boot-sunxi
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/h6-boot-debug.txt                                 $(DESTDIR)/boot/h6-boot-debug.txt
	@cp -f    $(WORKSRC)/h6-boot-debug.scr                                 $(DESTDIR)/boot/h6-boot-debug.scr
	@cp -f    $(WORKSRC)/h6-boot.txt                                       $(DESTDIR)/boot/h6-boot.txt
	@cp -f    $(WORKSRC)/h6-boot.scr                                       $(DESTDIR)/boot/h6-boot.scr
	@cp -f    $(WORKSRC)/h6-boot-debug.txt                                 $(DESTDIR)/boot/boot-debug.txt
	@cp -f    $(WORKSRC)/h6-boot-debug.scr                                 $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/h6-boot.txt                                       $(DESTDIR)/boot/boot.txt
	@cp -f    $(WORKSRC)/h6-boot.scr                                       $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/h6loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin \
		  $(DESTDIR)/boot/h6loaderfiles/u-boot-sunxi-with-spl.bin
	@cp -f    $(DESTDIR)/boot/dtbs/allwinner/sun50i-h6-tanix-tx6.dtb       $(DESTDIR)/boot/h6_dtb

clean-all:
	@rm -f  $(DESTDIR)/boot/h6-boot-debug.txt
	@rm -f  $(DESTDIR)/boot/h6-boot-debug.scr
	@rm -f  $(DESTDIR)/boot/h6-boot.txt
	@rm -f  $(DESTDIR)/boot/h6-boot.scr
	@rm -f  $(DESTDIR)/boot/boot-debug.txt
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.txt
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -f  $(DESTDIR)/boot/h6_dtb
	@rm -rf $(DESTDIR)/boot/h6loaderfiles*
