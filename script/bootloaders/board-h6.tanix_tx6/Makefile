
GARNAME      = bootfiles-h6.tanix_tx6
GARVERSION   = 2019-09-05
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               h6-boot-debug.scr \
               h6-boot-debug.txt \
               h6-boot.scr \
               h6-boot.txt \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = bootloaders/u-boot-sunxi

BUILD_SCRIPTS   =
INSTALL_SCRIPTS = custom

include ../../gar.mk

export mm_U-BOOT_BOARD_TYPE = tanix_tx6_mini_defconfig

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
	@cp -f    $(DESTDIR)/boot/dtbs/allwinner/sun50i-h6-tanix-tx6.dtb       $(DESTDIR)/boot/h6_dtb
	@$(MAKECOOKIE)

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
