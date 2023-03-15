
GARNAME      = bootfiles-h313-x96-q
GARVERSION   = 2023-03-13
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               h313-boot-debug.scr \
               h313-boot-debug.txt \
               h313-boot.scr       \
               h313-boot.txt       \
               minimyth.conf       \

# export mm_U-BOOT_BOARD_TYPE = orangepi_zero2_defconfig
# export mm_U-BOOT_BOARD_TYPE = h616_lpddr3_tvbox_defconfig
export mm_U-BOOT_BOARD_TYPE = x96q_defconfig

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
	@$(MAKE) clean-all install -C ../u-boot-h313
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKSRC)/h313-boot-debug.scr                                 $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKSRC)/h313-boot.scr                                       $(DESTDIR)/boot/boot.scr
	@mkdir -p $(DESTDIR)/boot/h313loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/h313/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin \
		  $(DESTDIR)/boot/h313loaderfiles/u-boot-sunxi-with-spl.bin
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f  $(DESTDIR)/boot/boot-debug.scr
	@rm -f  $(DESTDIR)/boot/boot.scr
	@rm -rf $(DESTDIR)/boot/h313loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
