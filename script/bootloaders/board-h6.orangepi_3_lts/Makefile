
GARNAME      = bootfiles-h6.orangepi_3_lts
GARVERSION   = 2023-04-13
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               h6-boot-debug.scr \
               h6-boot-debug.txt \
               h6-boot.scr       \
               h6-boot.txt       \
               minimyth.conf     \

export mm_U-BOOT_BOARD_TYPE = orangepi_3_lts_defconfig
export CRUST_CONFIG = orangepi_3_defconfig

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
	@$(MAKE) clean-all install -C ../crust
	@$(MAKE) clean-all install -C ../u-boot-h6
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/h6-boot-debug.scr                                 $(DESTDIR)/boot/boot-debug.scr
	@#cp -f    $(WORKSRC)/h6-boot.scr                                       $(DESTDIR)/boot/boot.scr
	@cp -f    $(WORKSRC)/h6-boot-debug.scr                                 $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/h6loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin \
		  $(DESTDIR)/boot/h6loaderfiles/u-boot-sunxi-with-spl.bin
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -rf $(DESTDIR)/boot/h6loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
